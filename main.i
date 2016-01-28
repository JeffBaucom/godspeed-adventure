# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);
void loadSpritePalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 90 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 100 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 139 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 233 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 291 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 2 "main.c" 2
# 1 "newSpritesheet.h" 1
# 22 "newSpritesheet.h"
extern const unsigned short newSpritesheetTiles[16384];


extern const unsigned short newSpritesheetMap[1024];


extern const unsigned short newSpritesheetPal[256];
# 3 "main.c" 2
# 1 "street.h" 1
# 22 "street.h"
extern const unsigned short streetTiles[880];


extern const unsigned short streetMap[2048];


extern const unsigned short streetPal[256];
# 4 "main.c" 2
# 1 "skyline.h" 1
# 21 "skyline.h"
extern const unsigned short skylineTiles[4976];


extern const unsigned short skylineMap[1024];
# 5 "main.c" 2
# 1 "splash.h" 1
# 21 "splash.h"
extern const unsigned short splashBitmap[19200];


extern const unsigned short splashPal[256];
# 6 "main.c" 2
# 1 "text.h" 1
# 9 "text.h"
void drawChar(int , int , char , unsigned short );
void drawString(int row, int col, char *str, unsigned short color);
void drawChar4(int row, int col, char ch, unsigned char colorIndex);

void drawString4(int row, int col, char *str, unsigned char colorIndex);

extern const unsigned char fontdata_6x8[12288];
# 7 "main.c" 2
# 1 "instr.h" 1
# 21 "instr.h"
extern const unsigned short instrBitmap[19200];


extern const unsigned short instrPal[256];
# 8 "main.c" 2
# 1 "pause.h" 1
# 21 "pause.h"
extern const unsigned short pauseBitmap[19200];


extern const unsigned short pausePal[256];
# 9 "main.c" 2
# 1 "win.h" 1
# 21 "win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 10 "main.c" 2
# 1 "lose.h" 1
# 21 "lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 11 "main.c" 2
# 1 "gameSong.h" 1
# 20 "gameSong.h"
extern const unsigned char gameSong[111519];
# 12 "main.c" 2
# 1 "shootSFX.h" 1
# 20 "shootSFX.h"
extern const unsigned char shootSFX[3070];
# 13 "main.c" 2
# 26 "main.c"
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
        *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                        (1<<2) |
                        (3<<8) |
                        0 |
                        (1<<11) |
                        (1<<3) |
                        (3<<12) |
                        (1<<14) |
                        (1<<15);

 *(u16*)0x04000080 = 0;
}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}


void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
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
    *(volatile unsigned short*)0x4000102 = 0;
    soundA.isPlaying = 0;
   } else {
    playSoundA(soundA.data, soundA.length, soundA.frequency);
   }
  }
  if (vbCountB >= soundB.duration) {
   if (!soundB.loops) {
    dma[2].cnt = 0;
    *(volatile unsigned short*)0x4000106 = 0;
    soundB.isPlaying = 0;
   } else {
    playSoundB(soundB.data, soundB.length, soundB.frequency);
   }
  }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {


        dma[1].cnt = 0;
        vbCountA = 0;

        int interval = 16777216/frequency;

        DMANow(1, sound, 0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -interval;
        *(volatile unsigned short*)0x4000102 = (1<<7);

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

        DMANow(2, sound, 0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -interval;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.isPlaying = 1;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.data = sound;
        soundB.duration = 59.727 * length / frequency;
}



void initializeGame() {
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);

 *(volatile unsigned short*)0x4000008 = 1<<14 | 0 << 2 | 27 << 8;
 *(volatile unsigned short*)0x400000A = 0<<14 | 1 << 2 | 24 << 8;

 loadPalette(streetPal);
 DMANow(3, streetTiles, &((charblock *)0x6000000)[0], 1760);
 DMANow(3, streetMap, &((screenblock *)0x6000000)[27], 4096);

 DMANow(3, skylineTiles, &((charblock *)0x6000000)[1], 9952);
 loadMap(skylineMap, 2048, 1, 24);

 loadSpritePalette(newSpritesheetPal);
    DMANow(3, newSpritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    playSoundA(gameSong, 111519, 11025);
    soundA.loops = 1;

}

void initializeSplash() {
 pauseLock = 0;
 *(unsigned short *)0x4000000 = 4 | (1<<10);
}

void initializePause() {
 *(unsigned short *)0x4000000 = 4 | (1<<10);
}


void hideSprites()
{
    for (int j = 0; j < 128; j++) {
     shadowOAM[j].attr0 = (2 << 8);
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
  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<3))) && pauseLock > 20) {
   pauseLock = 0;
   state = game;
   initializeGame();
   return;
  } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<2))) && pauseLock > 20) {
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
  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<3))) && pauseLock > 10) {
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

 if((~(*(volatile unsigned int *)0x04000130) & ((1<<6))))
  {
   if (kil.row > 2) {
    if (spawnOn) {
     kil.row = kil.row - kil.speed;
    }
   }
   seed++;
  }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<7))))
  {
   if (bigRow < 90 && !spawnOn) {
    vOff++;
    bigRow++;
   } else if (kil.row < 128) {
    kil.row = kil.row + kil.speed;
   }
  }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))))
  {
   if (kil.col > 2) {
    kil.col = kil.col - kil.speed;
   }
   seed++;
  }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
  {
   kil.col = kil.col + kil.speed;
  }
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {
  if (kil.shootLock <= 0) {
   shoot();
   kil.frame = 2;
   kil.shootLock = shootInit;
  }
 } else {
  kil.shootLock--;
 }
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<3))) && (pauseLock > 20)) {
  initializePause();
  pauseLock = 0;
  state = pause;
 } else {
  pauseLock++;
 }
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<9)))) {
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

 *(volatile unsigned short *)0x04000010 = hOff;
    *(volatile unsigned short *)0x04000012 = vOff;
    *(volatile unsigned short *)0x04000014 = hOff/2;
    *(volatile unsigned short *)0x04000016 = vOff/2;
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

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
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
  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<2)))) {
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
  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<2))) && pauseLock > 10) {
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
  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<2)))) {
   initializeSplash();
   initialize();
   state = splash;
   flipPage();
   return;
  }
 }
}

void drawKil() {
 shadowOAM[0].attr0 = kil.row | (2 << 14) | (0 << 10) | (0 << 8) | (0 << 13);
 shadowOAM[0].attr1 = kil.col | (2 << 14);
 shadowOAM[0].attr2 = (kil.frame*4)*32+(0);
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
   shadowOAM[bullets[i].ind].attr0 = bullets[i].row | (0 << 10) | (0 << 8) | (0 << 13);
   shadowOAM[bullets[i].ind].attr1 = bullets[i].col | (0 << 14);
   shadowOAM[bullets[i].ind].attr2 = (bullets[i].frame)*32+(4);
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
   shadowOAM[enemies[i].ind].attr0 = enemies[i].row | (2 << 14) | (0 << 10) | (0 << 8) | (0 << 13);
   shadowOAM[enemies[i].ind].attr1 = enemies[i].col | (2 << 14) | (1 << 12);
   shadowOAM[enemies[i].ind].attr2 = (enemies[i].frame*4)*32+(2);
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
    shadowOAM[bullets[j].ind].attr0 = (2 << 8);
    shadowOAM[enemies[i].ind].attr0 = (2 << 8);
    score++;
   }
  }
  if (enemies[i].active && enemies[i].col < 1) {
   enemies[i].active = 0;
   shadowOAM[enemies[i].ind].attr0 = (2 << 8);
   kil.health--;
  }
  if ((((kil.row >= enemies[i].row) && (kil.row <= enemies[i].row + 32))
   || ((kil.row + 32 <= enemies[i].row + 32) && (kil.row + 32 >= enemies[i].row))) && (kil.col + 16 >= enemies[i].col)) {
   enemies[i].active = 0;
   shadowOAM[enemies[i].ind].attr0 = (2 << 8);
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

 shadowOAM[boss.ind].attr0 = boss.row | (2 << 14) | (0 << 10) | (0 << 8) | (0 << 13);
 shadowOAM[boss.ind].attr1 = boss.col | (2 << 14) | (1 << 12);
 shadowOAM[boss.ind].attr2 = ((2)*4)*32+(2);

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
  shadowOAM[bossBullet.ind].attr0 = bossBullet.row | (0 << 10) | (0 << 8) | (0 << 13);
  shadowOAM[bossBullet.ind].attr1 = bossBullet.col | (0 << 14);
  shadowOAM[bossBullet.ind].attr2 = (bossBullet.frame)*32+(5);
 }


}

void bossCollisions() {
 for (int i = 0; i < 10; i++) {
  if (bullets[i].active && (bullets[i].col + 8 >= boss.col)
    && ((bullets[i].row >= boss.row) && (bullets[i].row + 8 <= boss.row + 32))) {
   bullets[i].active = 0;
   shadowOAM[bullets[i].ind].attr0 = (2 << 8);
   boss.health -= 10;
  }
 }
 if (bossBullet.active && (bossBullet.row >= kil.row) && (bossBullet.row + 8 <=kil.row + 32) && (bossBullet.col <= kil.col + 16)) {
  bossBullet.active = 0;
  kil.health--;
  shadowOAM[bossBullet.ind].attr0 = (2 << 8);
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
 playSoundB(shootSFX, 11025, 3070);
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
    *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
    bigRow = 0;

    buttons = *(volatile unsigned int *)0x04000130;
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
