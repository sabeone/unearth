/************************************************************
*   UNEARTH by Sabrina Wilson       CS 2261 April 2019      *
*                                                           *
*   A game about mining bitcoins and fighting goblins.      *
*************************************************************/

#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

void delay(int amt) {
    volatile int trash = 0;
    for (int i = 0; i < amt; i++) {
        trash++;
    }
}

// Set a pixel on the screen in Mode 3
void setPixel3(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int row, int col, unsigned char colorIndex) {

    unsigned short pixelData = videoBuffer[OFFSET(row, col, SCREENWIDTH)/2];
    
    if (col & 1) {
        pixelData &= 0x00FF;
        pixelData |= (colorIndex << 8);
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    
    videoBuffer[OFFSET(row, col, SCREENWIDTH)/2] = pixelData;

}

// Use same padding for walls and dividers
void drawHorzWalls3(int padding, unsigned short color) {
    int row;
    int col;

    // Top
    row = 0 + padding;
    col = 0 + padding;

    for (int i = 0; i < (SCREENWIDTH - (padding * 2)); i++) {
        setPixel3(row, col, color);
        col++;
    }

    // Bottom
    row = SCREENHEIGHT - 1 - padding;
    col = 0 + padding;

    for (int i = 0; i < (SCREENWIDTH - (padding * 2)); i++) {
        setPixel3(row, col, color);
        col++;
    }
}

void drawVertWalls3(int padding, unsigned short color) {
    int row;
    int col;

    // Left
    row = 0 + padding;
    col = 0 + padding;

    for (int i = 0; i < (SCREENHEIGHT - (padding * 2)); i++) {
        setPixel3(row, col, color);
        row++;
    }

    // Right
    row = 0 + padding;
    col = SCREENWIDTH - 1 - padding;

    for (int i = 0; i < (SCREENHEIGHT - (padding * 2)); i++) {
        setPixel3(row, col, color);
        row++;
    }
}

void drawVertDivider3(int padding, int spacing, unsigned short color) {

    int offset = padding + 2*spacing;

    for (int r = offset; r < (SCREENHEIGHT - offset); r += spacing) {
        setPixel3(r, CENTER_COL, color);
    }
}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

   volatile unsigned short color = colorIndex | (colorIndex<<8);

    for (int i = 0; i < height; i++) {

        // Odd Col
        if (col & 1) {

            // Odd Width
            if (width & 1) { 
                setPixel4(row + i, col, colorIndex);
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[OFFSET(row + i, col + 1, SCREENWIDTH) / 2], (width / 2) | DMA_SOURCE_FIXED);
                }
            } 

            // Even Width
            else {
                setPixel4(row + i, col, colorIndex);
                if (width > 2) {
                    DMANow(3, &color, &videoBuffer[OFFSET(row + i, col + 1, SCREENWIDTH) / 2], (width / 2 - 1) | DMA_SOURCE_FIXED);
                }
                setPixel4(row + i, col + width - 1, colorIndex);
            }
        } 

        // Even Col
        else {

            // Odd Width
            if (width & 1) {
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[OFFSET(row + i, col, SCREENWIDTH) / 2], (width / 2) | DMA_SOURCE_FIXED);
                }
                setPixel4(row + i, col + width - 1, colorIndex);
            } 

            // Even Width
            else {
                DMANow(3, &color, &videoBuffer[OFFSET(row + i, col, SCREENWIDTH) / 2], (width / 2) | DMA_SOURCE_FIXED);
            }
        }
    }

}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

void fillHalfScreens3(unsigned short colorL, unsigned short colorR) {
    // 120 col, SCREENHEIGHT row
    int row = 0;
    int col = 0;
    for (int i = 0; i < 120*SCREENHEIGHT; i++) {
        if ((i != 0) && ((i % 120) == 0)) {
            row++;
        }
        col = i % 120;
        setPixel3(row, col, colorL);
    }

    row = 0;
    col = 0;
    for (int i = 0; i < 120*SCREENHEIGHT; i++) {
        if ((i != 0) && ((i % 120) == 0)) {
            row++;
        }
        col = 120 + (i % 120);
        setPixel3(row, col, colorR);
    }
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, ((SCREENWIDTH * SCREENHEIGHT) / 2) | DMA_SOURCE_FIXED);

}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int row, int col, int height, int width, const unsigned short *image) {

     for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)/2], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], width/2);
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

   DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);

}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}

// Hides all sprites in the shadowOAM
void hideSprites() {
    
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    
}