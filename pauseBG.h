
//{{BLOCK(pauseBG)

//======================================================================
//
//	pauseBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 58 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1856 + 2048 = 4416
//
//	Time-stamp: 2019-04-22, 03:20:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBGTilesLen 1856
extern const unsigned short pauseBGTiles[928];

#define pauseBGMapLen 2048
extern const unsigned short pauseBGMap[1024];

#define pauseBGPalLen 512
extern const unsigned short pauseBGPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBG)
