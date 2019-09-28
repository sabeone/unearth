/************************************************************
*	UNEARTH by Sabrina Wilson		CS 2261	April 2019		*
*															*
*	A game about mining bitcoins and fighting goblins.		*
*************************************************************/

#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "sound.h"
#include "AxeSFX.h"
#include "CoinSFX.h"
#include "GoblinSFX.h"
#include "QueenSFX.h"
#include "CheatSFX.h"
#include "DeathSFX.h"
#include "TheftSFX.h"

/* ************************ CONTROLS ************************
 * START				pause/resume game
 * LEFT/RIGHT/UP/DOWN 	move dwarf left/right/up/down
 * A (press)			swing axe
 * B (press)			toggle cheat (no goblins)
 */

/************************* VARIABLES ************************/

OBJ_ATTR shadowOAM[OAMCOUNT];
int curOamIndex;

int cheatEnable;
int queenActivated;
int locationCount;
int curLocationIndex;
int goblinCount;
int coinCount;
int coinsRemaining;
int curCollect;
int locCount;

LOCATION locations[MAXLOCATIONS];
DIRT dirtPatches[MAXLOCATIONS];
DWARF dwarf;
GOBLIN goblins[MAXGOBLINS];
COIN coins[MAXCOINS];
COIN collectedCoins[MAXCOINS];

/*************************** GAME ***************************/

void initGame() {

	curOamIndex = 1;

	cheatEnable = 0;
	queenActivated = 0;
	locationCount = (((unsigned int)rand()) % (MAXLOCATIONS - MINLOCATIONS + 1)) + MINLOCATIONS;
	curLocationIndex = 0;
	goblinCount = (((unsigned int)rand()) % (MAXGOBLINS - MINGOBLINS + 1)) + MINGOBLINS;
	coinCount = (((unsigned int)rand()) % (MAXCOINS - MINCOINS + 1)) + MINCOINS;
	coinsRemaining = coinCount;
	curCollect = 0;
	locCount = locationCount;

	initLocations();
	initCollectedCoins();
	initDwarf();
	initCoins();
	initGoblins();
	initDirt();
	
	
}

void updateGame() {
	updateDwarf();
	animateDwarf();

	for (int i = 0; i < locationCount; i++)
		updateDirt(&dirtPatches[i]);
	
	for (int i = 0; i < goblinCount; i++) {
		updateGoblin(&goblins[i]);
		animateGoblin(&goblins[i]);
	}
	
	for (int i = 0; i < coinCount; i++)
		updateCoin(&coins[i]);
}

void drawGame() {
	drawDwarf();

	for (int i = 0; i < locationCount; i++)
		drawDirt(&dirtPatches[i]);
		
	for (int i = 0; i < goblinCount; i++)
		drawGoblin(&goblins[i]);
	
	for (int i = 0; i < coinCount; i++)
		drawCoin(&coins[i]);

	drawCollectedCoins();
}

/************************* LOCATION **************************/

void initLocations() {
	for (int i = 0; i < locationCount; i++ ) {
		locations[i].validRow = ((unsigned int)rand()) % (144 - 8) + 8;
			if (locations[i].validRow < 0)
				locations[i].validRow *= -1;
		locations[i].validCol = ((unsigned int)rand()) % 224;
			if (locations[i].validCol < 0)
				locations[i].validCol *= -1;

		// make sure each new random location does not overlap with a previous location
		if (i > 0) {
			for (int j = 0; j < i;) {
				if (collision(locations[j].validRow, locations[j].validCol, SPRITEHEIGHT, SPRITEWIDTH, 
					locations[i].validRow, locations[i].validCol, SPRITEHEIGHT, SPRITEWIDTH)) {
					locations[i].validRow = ((unsigned int)rand()) % (144 - 8) + 8;
					if (locations[i].validRow < 0)
						locations[i].validRow *= -1;
					locations[i].validCol = ((unsigned int)rand()) % 224;
					if (locations[i].validCol < 0)
						locations[i].validCol *= -1;
					j = -1;
				}
				j++;
			}
	 	}
	}
}


/*************************** DIRT ***************************/

void initDirt() {
	for (int i = 0; i < locationCount; i++) {
		dirtPatches[i].oamIndex = curOamIndex;
		curOamIndex++;
		dirtPatches[i].height = SPRITEHEIGHT;
		dirtPatches[i].width = SPRITEWIDTH;
		dirtPatches[i].row = locations[i].validRow;
		dirtPatches[i].col = locations[i].validCol;
		dirtPatches[i].remaining = (((unsigned int)rand()) % (MAXREMAINING - MINREMAINING + 1)) + MINREMAINING;;
		dirtPatches[i].aniState = _DIRT;	
	}
}

void updateDirt(DIRT *d) {
	// Mine an unmined dirt patch if dwarf swings axe on it
	if (dwarf.isSwinging && collision(d->row, d->col, d->height, d->width, dwarf.row, dwarf.col, dwarf.height, dwarf.width)) {
		d->remaining--;

		if (d->remaining == 0) 
			locCount--;
	}
}

void drawDirt(DIRT *d) {
	// show unmined dirt only
	if (d->remaining > 0) {
		shadowOAM[d->oamIndex].attr0 = (ROWMASK & d->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[d->oamIndex].attr1 = (COLMASK & d->col) | ATTR1_SMALL;
		shadowOAM[d->oamIndex].attr2 = ATTR2_TILEID(0, d->aniState*2) | ATTR2_PALROW(0);
	} else {
		shadowOAM[(d->oamIndex)].attr0 = ATTR0_HIDE;
	}
}

/*************************** DWARF **************************/

void initDwarf() {
	dwarf.oamIndex = 0;
	dwarf.height = SPRITEHEIGHT;
	dwarf.width = SPRITEWIDTH;
	dwarf.row = SCREENHEIGHT/2 - dwarf.height/2;
	dwarf.col = SCREENWIDTH/2 - dwarf.width/2;
	dwarf.rVel = 2;
	dwarf.cVel = 2;
	dwarf.isSwinging = 0;
	dwarf.aniCounter = 0;
	dwarf.aniState = DWARF_FRONT;
	dwarf.prevAniState = dwarf.aniState;
	dwarf.curFrame = 0;
	dwarf.numFrames = 3;
}

void updateDwarf() {
	// toggle cheat
	if (BUTTON_PRESSED(BUTTON_B)) { // z
		playSoundB(CheatSFX, CHEATSFXLEN, CHEATSFXFREQ, 0);
		cheatEnable = !cheatEnable;
		goblins[0].isQueen = !goblins[0].isQueen;
	}

	// toggle  axe
	if (BUTTON_PRESSED(BUTTON_A)) { // x
		playSoundB(AxeSFX, AXESFXLEN, AXESFXFREQ, 0);
		dwarf.isSwinging = 	1;
	}
	else
		dwarf.isSwinging = 0;

	// move around
	if (BUTTON_HELD(BUTTON_UP) && (dwarf.row-dwarf.rVel > 0))
		dwarf.row -= dwarf.rVel;
	if (BUTTON_HELD(BUTTON_DOWN) && (dwarf.row+dwarf.rVel < SCREENHEIGHT-dwarf.height))
		dwarf.row += dwarf.rVel;
	if (BUTTON_HELD(BUTTON_LEFT) && (dwarf.col-dwarf.cVel > 0))
		dwarf.col -= dwarf.cVel;
	if (BUTTON_HELD(BUTTON_RIGHT) && (dwarf.col+dwarf.cVel < SCREENWIDTH-dwarf.width))
		dwarf.col += dwarf.cVel;
}

void animateDwarf() {
	// update previous animation state
	dwarf.prevAniState = dwarf.aniState;
	dwarf.aniState = DWARF_IDLE;

	// update animation frame
	if (dwarf.aniCounter % FRAMERATE == 0)
		dwarf.curFrame = (dwarf.curFrame + 1) % dwarf.numFrames;

	// update animation state
	if (BUTTON_HELD(BUTTON_UP))
			dwarf.aniState = DWARF_BACK;
	if (BUTTON_HELD(BUTTON_DOWN))
			dwarf.aniState = DWARF_FRONT;
	if (BUTTON_HELD(BUTTON_LEFT))
			dwarf.aniState = DWARF_LEFT;
	if (BUTTON_HELD(BUTTON_RIGHT))
			dwarf.aniState = DWARF_RIGHT;

	// stand still if not moved (idle)
	if (dwarf.aniState == DWARF_IDLE) {
		dwarf.curFrame = 0;
		dwarf.aniCounter = 0;
		dwarf.aniState = dwarf.prevAniState;
	} else {
		dwarf.aniCounter++;
	}
}

void drawDwarf() {
	shadowOAM[dwarf.oamIndex].attr0 = (ROWMASK & dwarf.row) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[dwarf.oamIndex].attr1 = (COLMASK & dwarf.col) | ATTR1_SMALL;
	shadowOAM[dwarf.oamIndex].attr2 = ATTR2_TILEID(dwarf.curFrame*2, dwarf.aniState*2) | ATTR2_PALROW(0);
}


/************************** GOBLIN **************************/

void initGoblins() {
	for (int i = 0; i < goblinCount; i++) {
		goblins[i].oamIndex = curOamIndex;
		curOamIndex++;
		goblins[i].height = SPRITEHEIGHT;
		goblins[i].width = SPRITEWIDTH-1;

		// put goblin at a valid location
		goblins[i].locIndex = curLocationIndex;
		goblins[i].row = locations[curLocationIndex].validRow;
		goblins[i].col = locations[curLocationIndex].validCol;
		curLocationIndex++;
		
		goblins[i].rVel = (((unsigned int)rand()) % 2 == 0) ? -1 : 1;
		goblins[i].cVel = (((unsigned int)rand()) % 2 == 0) ? -1 : 1;
		goblins[i].health = (((unsigned int)rand()) % (MAXHEALTH - MINHEALTH + 1)) + MINHEALTH;
		goblins[i].isQueen = (i == 0) ? 1 : 0;
		goblins[i].isActive = 0;
		goblins[i].aniCounter = 0;
		goblins[i].aniState = GOBLIN_FRONT;
		goblins[i].curFrame = 0;
		goblins[i].numFrames = 3;
	}

}

void updateGoblin(GOBLIN *g) {
	// activate live goblin if covering dirt patch is mined
	if (dirtPatches[g->locIndex].remaining <= 0 && g->health > 0) {
		if (g->isQueen) {
			playSoundB(QueenSFX, QUEENSFXLEN, QUEENSFXFREQ, 0);
			queenActivated = 1; // lose condition
		}
		g->isActive = 1;
	}

	if (g->isActive) {
		// steal a coin if escapes
		if (g->row == 0 || g->row == SCREENHEIGHT-g->height || g->col == 0 || g->col == SCREENWIDTH-g->width) {
			if (curCollect > 0) {
				curCollect--;
				playSoundB(TheftSFX, THEFTSFXLEN, THEFTSFXFREQ, 0);
				// communicate score: remove coin from top row
				for (int i = coinCount-1; i >= 0; i--) {
					if (collectedCoins[i].isActive) {
						collectedCoins[i].isActive = 0;
						break;
					}
				}
			}
			g->health = 0;
			g->isActive = 0;
		}

		// get damaged by dwarf
		if (dwarf.isSwinging && collision(g->row, g->col, g->height, g->width,
			dwarf.row, dwarf.col, dwarf.height, dwarf.width)) {
			if (g->health == 0) {
				playSoundB(DeathSFX, DEATHSFXLEN, DEATHSFXFREQ, 0);
				g->isActive = 0;
			}
			g->health--;
		}
			

		// move to escape
		if (g->locIndex && 1 == 0)
			g->row += g->rVel;
		else
			g->col += g->cVel;
	}
}

void animateGoblin(GOBLIN *g) {
	// update previous animation state (moving - otherwise same aniState)
	g->prevAniState = g->aniState;

	// update animation frame
	if (g->aniCounter % FRAMERATE == 0)
		g->curFrame = (g->curFrame + 1) % g->numFrames;

	if (g->locIndex && 1 == 0) {
		if (g->rVel < 0)
			g->aniState = GOBLIN_BACK;
		else
			g->aniState = GOBLIN_FRONT;
	} else {
		if (g->cVel < 0)
			g->aniState = GOBLIN_LEFT;
		else
			g->aniState = GOBLIN_RIGHT;
	}

	g->aniCounter++;
}

void drawGoblin(GOBLIN *g) {
	if (g->isActive) {
		shadowOAM[g->oamIndex].attr0 = (ROWMASK & g->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[g->oamIndex].attr1 = (COLMASK & g->col) | ATTR1_SMALL;
		shadowOAM[g->oamIndex].attr2 = ATTR2_TILEID(g->curFrame*2, g->aniState*2) | ATTR2_PALROW(0);
	} else {
		shadowOAM[g->oamIndex].attr0 = ATTR0_HIDE;
	}
}

/*************************** COIN ***************************/

void initCoins() {
	for (int i = 0; i < coinCount; i++) {
		coins[i].oamIndex = curOamIndex;
		curOamIndex++;
		coins[i].height = SPRITEHEIGHT;
		coins[i].width = SPRITEWIDTH;

		// put coin at a valid location
		coins[i].locIndex = curLocationIndex;
		coins[i].row = locations[curLocationIndex].validRow;
		coins[i].col = locations[curLocationIndex].validCol;
		curLocationIndex++;

		coins[i].rVel = 1;
		coins[i].cVel = 1;
		coins[i].isActive = 0;
		coins[i].isCollected = 0;
		coins[i].isStolen = 0;
		coins[i].aniState = _COIN;
	}
}

void updateCoin(COIN *c) {
	// activate uncollected coin if covering dirt patch is mined
	if (dirtPatches[c->locIndex].remaining <= 0 && c->isCollected == 0) {
		playSoundB(CoinSFX, COINSFXLEN, COINSFXFREQ, 0);
		c->isActive = 1;
		c->isCollected = 1;
		coinsRemaining--;
		curCollect++;
	}

	// move active coin to top of screen
	if (c->isActive) {
		c->row--;

		// deactivate coin when it reaches top of screen
		if (c->row == 0) {
			c->isActive = 0;

			// communicate score: activate next coin on top row
			for (int i = 0; i < coinCount; i++)
				if (!collectedCoins[i].isActive) {
					collectedCoins[i].isActive = 1;
					break;
				}
		}
	}
}

void drawCoin(COIN *c) {
	if (c->isActive && !c->isStolen) {
		shadowOAM[c->oamIndex].attr0 = (ROWMASK & c->row) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[c->oamIndex].attr1 = (COLMASK & c->col) | ATTR1_SMALL;
		shadowOAM[c->oamIndex].attr2 = ATTR2_TILEID(0, c->aniState*2) | ATTR2_PALROW(0);
	} else {
		shadowOAM[c->oamIndex].attr0 = ATTR0_HIDE;
	}
}

void initCollectedCoins() {
	for (int i = 0; i < coinCount; i++) {
		collectedCoins[i].oamIndex = curOamIndex;
		curOamIndex++;
		collectedCoins[i].row = 0;
		collectedCoins[i].col = i * SPRITEWIDTH;
		collectedCoins[i].isActive = 0;
		collectedCoins[i].aniState = _COIN;
	}
}

void drawCollectedCoins() {
	for (int i = 0; i < coinCount; i++) {
		if (collectedCoins[i].isActive) {
			shadowOAM[collectedCoins[i].oamIndex].attr0 = (ROWMASK & collectedCoins[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[collectedCoins[i].oamIndex].attr1 = (COLMASK & collectedCoins[i].col) | ATTR1_SMALL;
			shadowOAM[collectedCoins[i].oamIndex].attr2 = ATTR2_TILEID(0, collectedCoins[i].aniState*2) | ATTR2_PALROW(0);
		} else {
			shadowOAM[collectedCoins[i].oamIndex].attr0 = ATTR0_HIDE;
		}

	}
}