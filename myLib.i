# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"






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
# 8 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;

void delay(int amt) {
    volatile int trash = 0;
    for (int i = 0; i < amt; i++) {
        trash++;
    }
}


void setPixel3(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int row, int col, unsigned char colorIndex) {

    unsigned short pixelData = videoBuffer[((row)*(240)+(col))/2];

    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }

    videoBuffer[((row)*(240)+(col))/2] = pixelData;

}


void drawHorzWalls3(int padding, unsigned short color) {
    int row;
    int col;


    row = 0 + padding;
    col = 0 + padding;

    for (int i = 0; i < (240 - (padding * 2)); i++) {
        setPixel3(row, col, color);
        col++;
    }


    row = 160 - 1 - padding;
    col = 0 + padding;

    for (int i = 0; i < (240 - (padding * 2)); i++) {
        setPixel3(row, col, color);
        col++;
    }
}

void drawVertWalls3(int padding, unsigned short color) {
    int row;
    int col;


    row = 0 + padding;
    col = 0 + padding;

    for (int i = 0; i < (160 - (padding * 2)); i++) {
        setPixel3(row, col, color);
        row++;
    }


    row = 0 + padding;
    col = 240 - 1 - padding;

    for (int i = 0; i < (160 - (padding * 2)); i++) {
        setPixel3(row, col, color);
        row++;
    }
}

void drawVertDivider3(int padding, int spacing, unsigned short color) {

    int offset = padding + 2*spacing;

    for (int r = offset; r < (160 - offset); r += spacing) {
        setPixel3(r, 120, color);
    }
}


void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

   volatile unsigned short color = colorIndex | (colorIndex<<8);

    for (int i = 0; i < height; i++) {


        if (col & 1) {


            if (width & 1) {
                setPixel4(row + i, col, colorIndex);
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (width / 2) | (2 << 23));
                }
            }


            else {
                setPixel4(row + i, col, colorIndex);
                if (width > 2) {
                    DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], (width / 2 - 1) | (2 << 23));
                }
                setPixel4(row + i, col + width - 1, colorIndex);
            }
        }


        else {


            if (width & 1) {
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col)) / 2], (width / 2) | (2 << 23));
                }
                setPixel4(row + i, col + width - 1, colorIndex);
            }


            else {
                DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col)) / 2], (width / 2) | (2 << 23));
            }
        }
    }

}


void fillScreen3(volatile unsigned short color) {

 DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160));
}

void fillHalfScreens3(unsigned short colorL, unsigned short colorR) {

    int row = 0;
    int col = 0;
    for (int i = 0; i < 120*160; i++) {
        if ((i != 0) && ((i % 120) == 0)) {
            row++;
        }
        col = i % 120;
        setPixel3(row, col, colorL);
    }

    row = 0;
    col = 0;
    for (int i = 0; i < 120*160; i++) {
        if ((i != 0) && ((i % 120) == 0)) {
            row++;
        }
        col = 120 + (i % 120);
        setPixel3(row, col, colorR);
    }
}


void fillScreen4(volatile unsigned char colorIndex) {

    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, ((240 * 160) / 2) | (2 << 23));

}


void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row+r)*(240)+(col))], width);
    }
}


void drawImage4(int row, int col, int height, int width, const unsigned short *image) {

     for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))/2], &videoBuffer[((row+r)*(240)+(col))/2], width/2);
    }

}


void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {

   DMANow(3, image, videoBuffer, 240 * 160 / 2);

}


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {

    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}


void hideSprites() {

    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }

}
