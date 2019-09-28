
//{{BLOCK(skyBG)

//======================================================================
//
//	skyBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 430 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 13760 + 4096 = 18368
//
//	Time-stamp: 2019-04-22, 03:06:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKYBG_H
#define GRIT_SKYBG_H

#define skyBGTilesLen 13760
extern const unsigned short skyBGTiles[6880];

#define skyBGMapLen 4096
extern const unsigned short skyBGMap[2048];

#define skyBGPalLen 512
extern const unsigned short skyBGPal[256];

#endif // GRIT_SKYBG_H

//}}BLOCK(skyBG)
