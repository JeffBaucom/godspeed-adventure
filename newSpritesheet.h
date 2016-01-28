
//{{BLOCK(newSpritesheet)

//======================================================================
//
//	newSpritesheet, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2015-11-25, 18:46:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_NEWSPRITESHEET_H
#define GRIT_NEWSPRITESHEET_H

#define newSpritesheetTilesLen 32768
extern const unsigned short newSpritesheetTiles[16384];

#define newSpritesheetMapLen 2048
extern const unsigned short newSpritesheetMap[1024];

#define newSpritesheetPalLen 512
extern const unsigned short newSpritesheetPal[256];

#endif // GRIT_NEWSPRITESHEET_H

//}}BLOCK(newSpritesheet)
