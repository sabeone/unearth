
//{{BLOCK(splashBG)

//======================================================================
//
//	splashBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 102 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 3264 + 4096 = 7872
//
//	Time-stamp: 2019-04-22, 12:10:56
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHBG_H
#define GRIT_SPLASHBG_H

#define splashBGTilesLen 3264
extern const unsigned short splashBGTiles[1632];

#define splashBGMapLen 4096
extern const unsigned short splashBGMap[2048];

#define splashBGPalLen 512
extern const unsigned short splashBGPal[256];

#endif // GRIT_SPLASHBG_H

//}}BLOCK(splashBG)
