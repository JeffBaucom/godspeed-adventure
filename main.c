#include "myLib.h"
#include "newSpritesheet.h"
#include "street.h"
#include "skyline.h"
#include "splash.h"
#include "text.h"
#include "instr.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "gameSong.h"
#include "shootSFX.h"

/**************************************************************
CHEAT: L to boost movment speed and attack speed

My game is a sidescrolling shooter, you have to defeat enough enemies to 
reach the boss fight. The boss shoots faster bullets than you and can also dodge
your bullets. The game ends when you either run out of health, or you deplete the 
boss's health. If you touch too many enemies, or let too many through, you'll lose.

There are some issues with tearing on BoycottAdvance


***************************************************************/
unsigned int buttons;
unsigned int oldButtons;

int hOff = 0;
int vOff = 0;
int seed = 0;
int spawnOn = 0;
int spawnFreq = 20;
int score;
int pauseLock = 0;
int shootInit;
int bossFight;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
}SOUND;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

typedef void (*fp)();
fp state;

int bigRow;

int spawnPos[20] = {26, 77, 11, 126, 102, 17, 99, 15, 54, 30, 36, 49, 109, 111, 102, 86, 45, 68, 123, 120};

typedef struct  
{
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCount;
    int frame;
    int shootLock;
    int health;
    int speed;

} CHARACTER;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int active;
	int aniCount;
	int frame;
	int ind;
} BOLT;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int active;
	int aniCount;
	int frame;
	int ind;
} ENEMY;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int active;
	int aniCount;
	int frame;
	int ind;
	int health;
	int dodge;
} ILLUMI;

ILLUMI boss;

BOLT bossBullet;

ENEMY enemies[20];

BOLT bullets[10];

CHARACTER kil;

void setupSounds();
void setupInterrupts();
void interruptHandler();
void playSoundA( const unsigned char* sound, int length, int frequency);
void playSoundB( const unsigned char* sound, int length, int frequency);
void initializeGame();
void initializeSplash();
void initializePause();
void hideSprites();
void execute(fp func);
void splash();
void instructions();
void game();
void pause();
void win();
void lose();
void drawKil();
void shoot();
void drawEnemies();
void checkCollisions();
void spawnEnemy();
void drawBoss();
//enum { SPLASH, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};


int main()
{
	initialize();
	setupSounds();
	setupInterrupts();

	while(1) {
		state();
	}
	

}

void setupSounds()
{
        REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}


void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		if (soundA.isPlaying) {
			vbCountA++;
		}
		if (soundB.isPlaying) {
			vbCountB++;
		}

		if (vbCountA >= soundA.duration) {
			if (!soundA.loops) {
				dma[1].cnt = 0;
				REG_TM0CNT = 0;
				soundA.isPlaying = 0;
			} else {
				playSoundA(soundA.data, soundA.length, soundA.frequency);
			}
		}
		if (vbCountB >= soundB.duration) {
			if (!soundB.loops) {
				dma[2].cnt = 0;
				REG_TM1CNT = 0;
				soundB.isPlaying = 0;
			} else {
				playSoundB(soundB.data, soundB.length, soundB.frequency);
			}
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {


        dma[1].cnt = 0;
        vbCountA = 0;
	
        int interval = 16777216/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;

        soundA.isPlaying = 1;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.data = sound;
        soundA.duration = 59.727 * length / frequency;
}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;
	
        soundB.isPlaying = 1;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.data = sound;
        soundB.duration = 59.727 * length / frequency;
}



void initializeGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(27); //street
	REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(24); //skyline

	loadPalette(streetPal);
	DMANow(3, streetTiles, &CHARBLOCKBASE[0], streetTilesLen);
	DMANow(3, streetMap, &SCREENBLOCKBASE[27], streetMapLen);

	DMANow(3, skylineTiles, &CHARBLOCKBASE[1], skylineTilesLen);
	loadMap(skylineMap, skylineMapLen, 1, 24);

	loadSpritePalette(newSpritesheetPal);
    DMANow(3, newSpritesheetTiles, &CHARBLOCKBASE[4], newSpritesheetTilesLen/2);
    playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ);
    soundA.loops = 1;

}

void initializeSplash() {
	pauseLock = 0;
	REG_DISPCTL = MODE4 | BG2_ENABLE;
}

void initializePause() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
}


void hideSprites()
{
    for (int j = 0; j < 128; j++) {
    	shadowOAM[j].attr0 = ATTR0_HIDE;
    }
}

void execute(fp func) {

    func();

}

void splash() {
	initializeSplash();
	flipPage();
	fillScreen4(0);
	loadPalette(splashPal);
	drawBackgroundImage4(splashBitmap);
	char splashLine[40];
	sprintf(splashLine, "PRESS START");
	drawString4(10, 5, splashLine, 6);
	char splashLine2[40];
	sprintf(splashLine2, "TO PLAY");
	drawString4(20, 5, splashLine2, 6);
	char splashLine3[40];
	sprintf(splashLine3, "PRESS SELECT");
	drawString4(50, 140, splashLine3, 6);
	char splashLine4[40];
	sprintf(splashLine4, "FOR INSTRUCTIONS");
	drawString4(60, 140, splashLine4, 6);
	waitForVblank();
	flipPage();
	while (1) {
		if (BUTTON_HELD(BUTTON_START) && pauseLock > 20) {
			pauseLock = 0;
			state = game;
			initializeGame();
			return;
		} else if (BUTTON_HELD(BUTTON_SELECT) && pauseLock > 20) {
			pauseLock = 0;
			state = instructions;
			return;
		} else {
			pauseLock++;
		}
	}
	
	seed++;
}

void instructions() {
	flipPage();
	fillScreen4(0);
	loadPalette(instrPal);
	drawBackgroundImage4(instrBitmap);
	waitForVblank();
	flipPage();
	while (1) {
		if (BUTTON_HELD(BUTTON_START) && pauseLock > 10) {
			pauseLock = 0;
			state = splash;
			return;
		} else {
			pauseLock++;
		}
	}
}

void game() {
	
	if (!bossFight) {
		hOff++;
	}
	if (!spawnOn && bigRow == 90) {
		spawnOn++;
	}

	if (kil.aniCount % 10 == 0) {
		kil.frame++;
		if (kil.frame > 1) {
			kil.frame = 0;
		}
	}


	kil.aniCount++;

	if(BUTTON_HELD(BUTTON_UP))
		{
			if (kil.row > 2) {
				if (spawnOn) {
					kil.row = kil.row - kil.speed;
				}
			}
			seed++;
		}
	if(BUTTON_HELD(BUTTON_DOWN))
		{
			if (bigRow < 90 && !spawnOn) {
				vOff++;
				bigRow++;
			} else if (kil.row < 128) {
				kil.row = kil.row + kil.speed;
			}
		}
	if(BUTTON_HELD(BUTTON_LEFT))
		{
			if (kil.col > 2) {
				kil.col = kil.col - kil.speed;
			}
			seed++;
		}
	if(BUTTON_HELD(BUTTON_RIGHT))
		{
			kil.col = kil.col + kil.speed;
		}
	if(BUTTON_HELD(BUTTON_B)) {
		if (kil.shootLock <= 0) {
			shoot();
			kil.frame = 2;
			kil.shootLock = shootInit;
		}
	} else {
		kil.shootLock--;
	}
	if (BUTTON_HELD(BUTTON_START) && (pauseLock > 20)) {
		initializePause();
		pauseLock = 0;
		state = pause;
	} else {
		pauseLock++;
	}
	if (BUTTON_HELD(BUTTON_L)) {
		shootInit = 5;
		kil.speed = 3;
	}
	

	if ((seed % spawnFreq == 0) && (spawnOn) && !bossFight) {
		spawnEnemy();
		seed++;
	}

	if (kil.health == 0) {
		initializeSplash();
		state = lose;
	} else if (score > 50 && !bossFight) {
		bossFight = 1;
		spawnBoss();
	}

	if (bossFight && boss.health == 0) {
		initializeSplash();
		state = win;
	}

	REG_BG0HOFS = hOff;
    REG_BG0VOFS = vOff;
    REG_BG1HOFS = hOff/2;
    REG_BG1VOFS = vOff/2;
    checkCollisions();
	drawKil();
	drawBullets();
	drawEnemies();
	if (bossFight) {
		drawBoss();
		drawBossBullets();
		bossCollisions();
	} else {
		drawEnemies();
	}

	DMANow(3, shadowOAM, OAM, 512);
	waitForVblank();
	seed++;
}

void pause() {
	flipPage();
	fillScreen4(0);
	loadPalette(pausePal);
	drawBackgroundImage4(pauseBitmap);
	waitForVblank();
	flipPage();
	while (1) {
		if (BUTTON_HELD(BUTTON_SELECT)) {
			initializeGame();
			state = game;
			flipPage();
			return;
		}
	}
}

void win() {
	flipPage();
	fillScreen4(0);
	loadPalette(winPal);
	drawBackgroundImage4(winBitmap);
	waitForVblank();
	flipPage();
	while (1) {
		if (BUTTON_HELD(BUTTON_SELECT) && pauseLock > 10) {
			pauseLock = 0;
			initializeSplash();
			initialize();
			state = splash;
			flipPage();
			return;
		} else {
			pauseLock++;
		}
	}

}

void lose() {
	flipPage();
	fillScreen4(0);
	loadPalette(losePal);
	drawBackgroundImage4(loseBitmap);
	waitForVblank();
	flipPage();
	while (1) {
		if (BUTTON_HELD(BUTTON_SELECT)) {
			initializeSplash();
			initialize();
			state = splash;
			flipPage();
			return;
		}
	}
}

void drawKil() {
	shadowOAM[0].attr0 = kil.row | ATTR0_TALL | ATTR0_NORMAL | ATTR0_REGULAR | ATTR0_4BPP;
	shadowOAM[0].attr1 = kil.col | ATTR1_SIZE32;
	shadowOAM[0].attr2 = SPRITEOFFSET16(kil.frame*4, 0); 
}

void drawBullets() {
	for (int i = 0; i < 10; i++) {
		if (bullets[i].col > 240) {
				bullets[i].active = 0;
		}
		if (bullets[i].active) {
			bullets[i].aniCount++;
			if (bullets[i].aniCount % 5 == 0) {
				bullets[i].frame++;
				if (bullets[i].frame > 3) {
					bullets[i].frame = 0;
				}
			}
			bullets[i].col += bullets[i].cdel;
			shadowOAM[bullets[i].ind].attr0 = bullets[i].row | ATTR0_NORMAL | ATTR0_REGULAR | ATTR0_4BPP;
			shadowOAM[bullets[i].ind].attr1 = bullets[i].col | ATTR1_SIZE8;
			shadowOAM[bullets[i].ind].attr2 = SPRITEOFFSET16(bullets[i].frame, 4);
		}
	}
}

void drawEnemies() {
	for (int i = 0; i < 20; i++) {
		if (enemies[i].active) {
			if (enemies[i].aniCount % 10 == 0) {
				enemies[i].frame++;
				if (enemies[i].frame > 1) {
					enemies[i].frame = 0;
				}
			}
			enemies[i].aniCount++;

			enemies[i].col += enemies[i].cdel;
			shadowOAM[enemies[i].ind].attr0 = enemies[i].row | ATTR0_TALL | ATTR0_NORMAL | ATTR0_REGULAR | ATTR0_4BPP;
			shadowOAM[enemies[i].ind].attr1 = enemies[i].col | ATTR1_SIZE32 | ATTR1_HFLIP;
			shadowOAM[enemies[i].ind].attr2 = SPRITEOFFSET16(enemies[i].frame*4, 2); 
		}
	}
}

void spawnEnemy() {
	int ind;
	for (int i = 0; i < 20; i++) {
		if (!enemies[i].active) {
			ind = i;
			break;
		}
	}
	enemies[ind].active = 1;
	enemies[ind].row = spawnPos[seed%19];
	enemies[ind].col = 240;
	enemies[ind].cdel = -1;
}

void checkCollisions() {
	for (int i = 0; i < 20; i++) {
		for (int j = 0; j < 10; j++) {
			if ((bullets[j].active && enemies[i].active) && (bullets[j].col + 8 >= enemies[i].col) 
				&& ((bullets[j].row >= enemies[i].row) && (bullets[j].row + 8 <= enemies[i].row + 32))) {
				bullets[j].active = 0;
				enemies[i].active = 0;
				shadowOAM[bullets[j].ind].attr0 = ATTR0_HIDE;
				shadowOAM[enemies[i].ind].attr0 = ATTR0_HIDE;
				score++;
			}
		}
		if (enemies[i].active && enemies[i].col < 1) {
			enemies[i].active = 0;
			shadowOAM[enemies[i].ind].attr0 = ATTR0_HIDE;
			kil.health--;
		}
		if ((((kil.row >= enemies[i].row) && (kil.row <= enemies[i].row + 32))
			|| ((kil.row + 32 <= enemies[i].row + 32) && (kil.row + 32 >= enemies[i].row))) && (kil.col + 16 >= enemies[i].col)) {
			enemies[i].active = 0;
			shadowOAM[enemies[i].ind].attr0 = ATTR0_HIDE;
			kil.health--;
		}

	}

}

void spawnBoss() {
	boss.active = 1;
	boss.row = 75;
	boss.col = 220;
	boss.frame = 0;
	boss.aniCount++;
	boss.cdel = 0;
	boss.rdel = 0;
	boss.dodge = 0;
}

void drawBoss() {

	if (boss.aniCount % 20 == 0) {
		boss.frame++;
		if (boss.frame > 1) {
			boss.frame = 0;
		}
	}

	if (!bossBullet.active) {
		bossShoot();
	}
	if (boss.dodge == 0) {
		if (kil.row < boss.row) {
			boss.row--;
		} else {
			boss.row++;
		}
	} else {
		boss.dodge--;
	}
	
	shadowOAM[boss.ind].attr0 = boss.row | ATTR0_TALL | ATTR0_NORMAL | ATTR0_REGULAR | ATTR0_4BPP;
	shadowOAM[boss.ind].attr1 = boss.col | ATTR1_SIZE32 | ATTR1_HFLIP;
	shadowOAM[boss.ind].attr2 = SPRITEOFFSET16((2)*4, 2); 

}

void bossShoot() {
	bossBullet.ind = 32;
	bossBullet.active = 1;
	bossBullet.cdel = -4;
	bossBullet.row = boss.row + 16;
	bossBullet.col = boss.col;
}

void drawBossBullets() {
	if (bossBullet.active) {
		bossBullet.aniCount++;
		if (bossBullet.aniCount % 5 == 0) {
			bossBullet.frame++;
			if (bossBullet.frame > 2) {
				bossBullet.frame = 0;
			}
		}
		bossBullet.col += bossBullet.cdel;
		shadowOAM[bossBullet.ind].attr0 = bossBullet.row | ATTR0_NORMAL | ATTR0_REGULAR | ATTR0_4BPP;
		shadowOAM[bossBullet.ind].attr1 = bossBullet.col | ATTR1_SIZE8;
		shadowOAM[bossBullet.ind].attr2 = SPRITEOFFSET16(bossBullet.frame, 5);
	}


}

void bossCollisions() {
	for (int i = 0; i < 10; i++) {
		if (bullets[i].active && (bullets[i].col + 8 >= boss.col) 
				&& ((bullets[i].row >= boss.row) && (bullets[i].row + 8 <= boss.row + 32))) {
			bullets[i].active = 0;
			shadowOAM[bullets[i].ind].attr0 = ATTR0_HIDE;
			boss.health -= 10;
		}
	}
	if (bossBullet.active && (bossBullet.row >= kil.row) && (bossBullet.row + 8 <=kil.row + 32) && (bossBullet.col <= kil.col + 16)) {
		bossBullet.active = 0;
		kil.health--;
		shadowOAM[bossBullet.ind].attr0 = ATTR0_HIDE;
	}
	if (seed % 5 == 0) {
		for (int i = 0; i < 10; i++) {
			if (bullets[i].active) {
				if ((bullets[i].col > boss.col - 20) && ((bullets[i].row >= boss.row) && (bullets[i].row + 8 <= boss.row + 32))) {
					if (boss.row > 40) {
						boss.row -= 32;
					} else {
						boss.row += 32;
					}
					boss.dodge = 30;
				}
			}
		}
	}
	if (bossBullet.col < 1) {
		bossBullet.active = 0;
	}


}

void shoot() {
	int ind;
	for (int i = 0; i < 10; i++) {
		if (!bullets[i].active) {
			ind = i;
			break;
		}
	}
	playSoundB(shootSFX, SHOOTSFXFREQ, SHOOTSFXLEN);
	soundB.loops = 0;
	bullets[ind].active = 1;
	bullets[ind].col = kil.col + 16;
	bullets[ind].row = kil.row + 16;
	bullets[ind].cdel = 2;
	bullets[ind].aniCount = 0;
	bullets[ind].frame = 0;

}

void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    bigRow = 0;

    buttons = BUTTONS;
    state = splash;

    hideSprites();

    kil.row = 80;
	kil.col = 10;
    kil.rdel = 0;
    kil.cdel = 0;
    kil.aniCount = 0;
    kil.frame = 0;
    kil.shootLock = 10;
    kil.health = 100;
    kil.speed = 2;
    bossFight = 0;
    boss.health = 100;

    for (int i = 0; i < 10; i++) {
    	BOLT temp = {
    		.ind = i + 3,
    		.active = 0
    	};
    	bullets[i] = temp;
    }
    for (int i = 0; i < 20; i++) {
    	ENEMY temp = {
    		.ind = 21 + i,
    		.active = 0
    	};
    	enemies[i] = temp;
    }
    boss.ind = 60;
    

	seed = 0;
	spawnOn = 0;
	spawnFreq = 40;
	pauseLock = 0;
	hOff = 0;
	vOff = 0;
	score = 0;
	shootInit = 10;
}