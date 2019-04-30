#include <stdint.h>
#include <stdio.h>
#include <time.h>

extern int lab7(void);
extern int library_lab_7(void);
extern void UART0Handler(void);
extern void Timer0AHandler(void);
extern void Timer0BHandler(void);


int main(void)
{
    lab7();
}


