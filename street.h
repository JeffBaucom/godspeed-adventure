
//{{BLOCK(street)

//======================================================================
//
//	street, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 55 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1760 + 4096 = 6368
//
//	Time-stamp: 2015-11-03, 20:24:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STREET_H
#define GRIT_STREET_H

#define streetTilesLen 1760
extern const unsigned short streetTiles[880];

#define streetMapLen 4096
extern const unsigned short streetMap[2048];

#define streetPalLen 512
extern const unsigned short streetPal[256];

#endif // GRIT_STREET_H

//}}BLOCK(street)
