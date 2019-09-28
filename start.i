# 1 "start.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "start.c"






# 1 "splashBG.h" 1
# 22 "splashBG.h"
extern const unsigned short splashBGTiles[1632];


extern const unsigned short splashBGMap[2048];


extern const unsigned short splashBGPal[256];
# 8 "start.c" 2
# 1 "skyBG.h" 1
# 22 "skyBG.h"
extern const unsigned short skyBGTiles[6880];


extern const unsigned short skyBGMap[2048];


extern const unsigned short skyBGPal[256];
# 9 "start.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 10 "start.c" 2
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 67 "myLib.h"
extern unsigned short *videoBuffer;
# 88 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;




extern OBJ_ATTR shadowOAM[];
# 161 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 204 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 215 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 255 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 340 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 11 "start.c" 2
# 1 "game.h" 1
# 9 "game.h"
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
# 113 "game.h"
enum {_DIRT, DWARF_FRONT, DWARF_BACK, DWARF_LEFT, DWARF_RIGHT,
 GOBLIN_FRONT, GOBLIN_BACK, GOBLIN_LEFT, GOBLIN_RIGHT, _COIN,
 DWARF_IDLE, GOBLIN_IDLE};





extern OBJ_ATTR shadowOAM[128];
extern int curOamIndex;


extern int cheatEnable;
extern int queenActivated;
extern int locationCount;
extern int curLocationIndex;
extern int goblinCount;
extern int coinCount;
extern int coinsRemaining;

extern int curCollect;
extern int locCount;



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
# 12 "start.c" 2

unsigned short buttons;
unsigned short oldButtons;

int hOff;

void initStart() {


 (*(volatile unsigned short*)0x400000A) = (1<<14) | ((1)<<2) | ((24)<<8);
 (*(volatile unsigned short*)0x4000008) = (1<<14) | ((0)<<2) | ((28)<<8);


 DMANow(3, skyBGPal, ((unsigned short *)0x5000000), 512/2);


 DMANow(3, skyBGTiles, &((charblock *)0x6000000)[1], 13760/2);
 DMANow(3, splashBGTiles, &((charblock *)0x6000000)[0], 3264/2);


 DMANow(3, skyBGMap, &((screenblock *)0x6000000)[24], 4096/2);
 DMANow(3, splashBGMap, &((screenblock *)0x6000000)[28], 4096/2);

 (*(unsigned short *)0x4000000) = 0 | (1<<9) | (1<<8);

 hOff = (512-240)/2;
 buttons = (*(volatile unsigned short *)0x04000130);
}

void updateStart() {

 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
  hOff--;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
  hOff++;
 }
}

void drawStart() {

 (*(volatile unsigned short *)0x04000014) = hOff/2;
 (*(volatile unsigned short *)0x04000010) = hOff;
}
