
//{{BLOCK(groundBG)

//======================================================================
//
//	groundBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 80 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2560 + 2048 = 5120
//
//	Time-stamp: 2019-04-22, 03:33:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GROUNDBG_H
#define GRIT_GROUNDBG_H

#define groundBGTilesLen 2560
extern const unsigned short groundBGTiles[1280];

#define groundBGMapLen 2048
extern const unsigned short groundBGMap[1024];

#define groundBGPalLen 512
extern const unsigned short groundBGPal[256];

#endif // GRIT_GROUNDBG_H

//}}BLOCK(groundBG)
