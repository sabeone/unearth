/************************************************************
*	UNEARTH by Sabrina Wilson		CS 2261	April 2019		*
*															*
*	A game about mining bitcoins and fighting goblins.		*
*************************************************************/

SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
