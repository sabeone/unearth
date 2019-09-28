/************************************************************
*	UNEARTH by Sabrina Wilson		CS 2261	April 2019		*
*															*
*	A game about mining bitcoins and fighting goblins.		*
*************************************************************/

/********************** SPRITE STRUCTS **********************/

typedef struct {
	int validRow;
	int validCol;
} LOCATION;

typedef struct {
	int oamIndex;
	int height;
	int width;
    int row;
    int col;
	int remaining;
	int aniState;
} DIRT;

typedef struct {
	int oamIndex;
	int height;
	int width;
    int row;
    int col;
	int rVel;
	int cVel;
	int isSwinging;
	int aniCounter;
	int aniState;
	int prevAniState;
	int curFrame;
	int numFrames;
} DWARF;

typedef struct {
	int oamIndex;
	int height;
	int width;
    int locIndex;
    int row;
    int col;
	int rVel;
	int cVel;
	int health;
	int isQueen;
	int isActive;
	int aniCounter;
	int aniState;
	int prevAniState;
	int curFrame;
	int numFrames;
} GOBLIN;

typedef struct {
	int oamIndex;
	int height;
	int width;
    int locIndex;
    int row;
    int col;
	int rVel;
	int cVel;
	int value;
	int isActive;
	int isCollected;
	int isStolen;
	int aniState;
} COIN;


/************************* CONSTANTS ************************/


#define OAMCOUNT 128
#define FRAMERATE 20

#define BGHEIGHT 256
#define BGWIDTH 256

#define SPRITEWIDTH 16
#define SPRITEHEIGHT 16

/* Dirt Constants
 * randomize num axe hits needed to mine dirt patch */
#define MAXREMAINING 5
#define MINREMAINING 1

/* Goblin Constants
 * randomize num goblins in a game
 * randomize num axe hits needed to kill goblin */
#define MAXGOBLINS 8
#define MINGOBLINS 3
#define MAXHEALTH 6
#define MINHEALTH 2

/* Coin Constants
 * randomize num coins in a game*/
#define MAXCOINS 5
#define MINCOINS 3

/* Location Constants
 * randomize num dirt patches for dwarf to interact with */
#define MAXLOCATIONS (MAXGOBLINS + MAXCOINS + 2)
#define MINLOCATIONS (MINGOBLINS + MINCOINS + 2)


// aniStates from spritesheet (columns)
enum {_DIRT, DWARF_FRONT, DWARF_BACK, DWARF_LEFT, DWARF_RIGHT,
	GOBLIN_FRONT, GOBLIN_BACK, GOBLIN_LEFT, GOBLIN_RIGHT, _COIN,
	DWARF_IDLE, GOBLIN_IDLE};


/************************* VARIABLES ************************/

// OAM
extern OBJ_ATTR shadowOAM[OAMCOUNT];
extern int curOamIndex;

// Game
extern int cheatEnable;
extern int queenActivated;
extern int locationCount;
extern int curLocationIndex;
extern int goblinCount;
extern int coinCount;
extern int coinsRemaining;
// extern int goalCollect;
extern int curCollect;
extern int locCount;


/************************ PROTOTYPES ************************/
void initGame();
void updateGame();
void drawGame();
void initLocations();
void initDirt();
void updateDirt(DIRT *d);
void drawDirt(DIRT *d);
void initDwarf();
void updateDwarf();
void animateDwarf();
void drawDwarf();
void initGoblins();
void updateGoblin(GOBLIN *);
void animateGoblin(GOBLIN *);
void drawGoblin(GOBLIN *);
void initCoins();
void updateCoin(COIN *);
void drawCoin(COIN *);
void initCollectedCoins();
void drawCollectedCoins();