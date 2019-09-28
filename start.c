/************************************************************
*	UNEARTH by Sabrina Wilson		CS 2261	April 2019		*
*															*
*	A game about mining bitcoins and fighting goblins.		*
*************************************************************/

#include "splashBG.h" // BG1
#include "skyBG.h" // BG0
#include "spritesheet.h"
#include "myLib.h"
#include "game.h"

unsigned short buttons;
unsigned short oldButtons;

int hOff;

void initStart() {

	// set up bg registers
	REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(24);
	REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

	// load bg palette
	DMANow(3, skyBGPal, PALETTE, skyBGPalLen/2);

	// load tiles
	DMANow(3, skyBGTiles, &CHARBLOCK[1], skyBGTilesLen/2);
	DMANow(3, splashBGTiles, &CHARBLOCK[0], splashBGTilesLen/2);

	// load maps
	DMANow(3, skyBGMap, &SCREENBLOCK[24], skyBGMapLen/2);
	DMANow(3, splashBGMap, &SCREENBLOCK[28], splashBGMapLen/2);

	REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE;

	hOff = (512-SCREENWIDTH)/2;
	buttons = BUTTONS;
}

void updateStart() {

	if (BUTTON_HELD(BUTTON_LEFT)) {
		hOff--;
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		hOff++;
	}	
}

void drawStart() {

	REG_BG1HOFF = hOff/2;
	REG_BG0HOFF = hOff;
}

