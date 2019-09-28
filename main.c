/************************************************************
*	UNEARTH by Sabrina Wilson		CS 2261	April 2019		*
*															*
*	A game about mining bitcoins and fighting goblins.		*
*************************************************************/

/* ********************* MILESTONE INFO *********************

* FINAL			CHEAT CHANGED - magic sound heard when cheat
					activated, which deactivates the queen

				LOSE CHANGED - player also loses if they have
					no coins left at the end of the game

				SOUNDS CHANGED - added bubble pop sound when
					goblin steals coin, added goblin death
					sound, removed goblin activation laugh

				SPLASH BG CHANGED - replaced small bg with 
					wide bg to improve experience of 
					scrolling left and right

				DWARF CHANGED - increased speed to be able
					to catch goblins

				DIRT CHANGED - replaced test code with
					randomization so different num axe
					hits needed to mine dirt patch

				SPRITES CHANGED - re-made sprite sheet
 
 * FINISHED		Sprites and bg art
 				Simultaneous backgrounds on start screen
 				Sound effects for swinging axe, coin
 					activation, goblin activation, coin
 					loss, winning, and losing
 				State music
 				Player (dwarf) moves around and swings axe
 				Dirt patches appear within screen bounds
 				Dirt patches mined by a certain num axe hits
 				Coin moves to top and disappears when mined
 				Goblins move randomly when mined
 				Goblins steal coin when escaping offscreen
				Goblins killed by certain num axe hits
				Coins (score) at top dis/appear correctly
				Win when no coins left to collect
				Lose when queen goblin mined (activated)
				Cheat correctly gets rid of goblins
				Screens transition correctly now
 
 * TO ADD		Increase mins - more dirt, goblins, and coins
 					for longer gameplay.
 				Slow down goblin movement?
 				Display num coins collected on win screen?
 				Mosaic effect when dirt or goblin hit?
 				Mosaic effect when losing?
 				

 * KNOWN BUGS	...

 */

/* ************************ CONTROLS ************************
 * change states...
 * SPLASH SCREEN 	LEFT for Rules 		RIGHT for Game
 * RULES SCREEN 	SELECT for Splash 	START for Game
 * GAME SCREEN 		SELECT for Splash 	START for Pause
 * PAUSE SCREEN 	SELECT for Splash 	START for Game
 * WIN SCREEN 		START for Splash
 * LOSE SCREEN 		START for Splash
 */

/* ************************ CONTROLS ************************
 * during game state...
 * START				pause/resume game
 * LEFT/RIGHT/UP/DOWN 	move dwarf left/right/up/down
 * A (press)			swing axe
 * B (press)			toggle cheat (no goblins)
 */

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "start.h"
#include "splashBG.h"
#include "rulesBG.h"
#include "spritesheet.h"
#include "skyBG.h"
#include "groundBG.h"
#include "pauseBG.h"
#include "winBG.h"
#include "loseBG.h"
#include "lose2BG.h"
#include "sound.h"
#include "ScreenMusic.h"
#include "GameMusic.h"

/************************ PROTOTYPES ************************/

void toSplash();
void splash();
void toRules();
void rules();
void toGame();
void game();
void toPause();
void pause();
void toWin();
void win();
void toLose();
void lose();

/************************** STATES **************************/

enum {SPLASH, RULES, GAME, PAUSE, WIN, LOSE};
int state;

/************************ VARIABLES *************************/

// Buttons
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

/*********************** STATE MACHINE **********************/

int main() {

	setupSounds();
	setupInterrupts();
	playSoundA(ScreenMusic, SCREENMUSICLEN, SCREENMUSICFREQ, 1);

	toSplash();

	while(1) {

		// Update Buttons
		oldButtons = buttons;
		buttons = BUTTONS;

		// Update State
		switch(state) {
			case SPLASH:
				splash();
				break;
			case RULES:
				rules();
				break;
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case WIN:
				win();
				break;
			case LOSE:
				lose();
				break;
		}
	}
}


/********************** STATE FUNCTIONS *********************/

void toSplash() {
	seed = 0;

	// set state
	initStart();
	state = SPLASH;

}

void splash() {

	seed++;

	updateStart();
	drawStart();

	// display start
	waitForVBlank();

	// to rules
	if (hOff < (512-SCREENWIDTH)/2-200) {
		toRules();
	}

	// to game
	if (hOff > (512-SCREENWIDTH)/2+200) {
		srand(seed);
		initGame();
		toGame();
	}

}

void toRules() {

	REG_BG0HOFF = 0;

	// load screen background
	DMANow(3, rulesBGPal, PALETTE, rulesBGPalLen/2);
	DMANow(3, rulesBGTiles, &CHARBLOCK[0], rulesBGTilesLen/2);
	DMANow(3, rulesBGMap, &SCREENBLOCK[31], rulesBGMapLen/2);

	// set registers
	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	// set state
	state = RULES;

}

void rules() {

	seed++;

	// lock framerate
	waitForVBlank();

	// go to splash
	if (BUTTON_PRESSED(BUTTON_SELECT))
		toSplash();

	// go to game
	if (BUTTON_PRESSED(BUTTON_START)) {
		srand(seed);
		initGame();
		toGame();
	}

}

void toGame() {

	REG_BG0HOFF = 0;

	// load sprites
	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
	hideSprites();
	DMANow(3, &shadowOAM, OAM, 128*4);

	// load ground BG0 - 256 x 256 (small)
	DMANow(3, groundBGPal, PALETTE, groundBGPalLen/2);
	DMANow(3, groundBGTiles, &CHARBLOCK[0], groundBGTilesLen/2);
	DMANow(3, groundBGMap, &SCREENBLOCK[31], groundBGMapLen/2);

	// set registers
	REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0)| BG_SCREENBLOCK(31);
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	

	// set state
	playSoundA(GameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
	state = GAME;
}

void game() {

	// go to pause
	if (BUTTON_PRESSED(BUTTON_START))
		toPause();

	// make game
	updateGame();
	drawGame();

	// display game
	waitForVBlank();
	flipPage();
	DMANow(3, shadowOAM, OAM, 128*4);

	// win if goal coin value collected
	if (locCount == 0 && curCollect == 0)
		toLose();

	else if (locCount == 0 && curCollect > 0) 
		toWin();

	// lose if queen goblin unleashed or no coins left to reach goal value
	else if (queenActivated)
		toLose();

	// testing
	// if (BUTTON_PRESSED(BUTTON_L)) // test: press A
	// 	toWin();
	// if (BUTTON_PRESSED(BUTTON_R))	// test: press S
	// 	toLose();

}

void toPause() {

	// load screen background
	DMANow(3, pauseBGPal, PALETTE, pauseBGPalLen/2);
	DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen/2);
	DMANow(3, pauseBGMap, &SCREENBLOCK[31], pauseBGMapLen/2);

	// set registers
	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0)| BG_SCREENBLOCK(31);
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	// set state
	state = PAUSE;
	pauseSound();

}

void pause() {

	// lock framerate
	waitForVBlank();

	// go to game
	if (BUTTON_PRESSED(BUTTON_START)) {
		unpauseSound();
		toGame();
	}

	// go to splash
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		playSoundA(ScreenMusic, SCREENMUSICLEN, SCREENMUSICFREQ, 1);
		unpauseSound();
		toSplash();
	}

}

void toWin() {

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	// load screen background
	DMANow(3, winBGPal, PALETTE, winBGPalLen/2);
	DMANow(3, winBGTiles, &CHARBLOCK[0], winBGTilesLen/2);
	DMANow(3, winBGMap, &SCREENBLOCK[31], winBGMapLen/2);

	// set registers
	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0)| BG_SCREENBLOCK(31);
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	// set state
	state = WIN;
	playSoundA(ScreenMusic, SCREENMUSICLEN, SCREENMUSICFREQ, 1);

}

void win() {

	// lock framerate
	waitForVBlank();

	// go to splash
	if (BUTTON_PRESSED(BUTTON_START))
		toSplash();

}

void toLose() {

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	// load screen background
	if (queenActivated) {
		DMANow(3, loseBGPal, PALETTE, loseBGPalLen/2);
		DMANow(3, loseBGTiles, &CHARBLOCK[0], loseBGTilesLen/2);
		DMANow(3, loseBGMap, &SCREENBLOCK[31], loseBGMapLen/2);
	} else {
		DMANow(3, lose2BGPal, PALETTE, lose2BGPalLen/2);
		DMANow(3, lose2BGTiles, &CHARBLOCK[0], lose2BGTilesLen/2);
		DMANow(3, lose2BGMap, &SCREENBLOCK[31], lose2BGMapLen/2);
	}
	

	// set registers
	REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0)| BG_SCREENBLOCK(31);
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	// set state
	state = LOSE;
	playSoundA(ScreenMusic, SCREENMUSICLEN, SCREENMUSICFREQ, 1);

}

void lose() {

	// lock framerate
	waitForVBlank();

	// go to splash
	if (BUTTON_PRESSED(BUTTON_START))
		toSplash();

}
