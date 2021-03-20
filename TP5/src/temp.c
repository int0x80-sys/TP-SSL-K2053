#include "temp.h"
#include <stdio.h>
#include <stdlib.h>

static char* temps [MAX_CANT_TEMPS];
static int temp_counter;

char* new_temp()
{
    if(temp_counter == MAX_CANT_TEMPS)
    {
        printf("Error: Cantidad de temporales maxima alcanzada...\n");
        exit(1);
    }
    char* temp = temps[temp_counter++] = malloc(sizeof(char)*TEMPS_SIZE);
    sprintf(temp, "Temp#%d", temp_counter);

    return temp;
}

void free_temps()
{
    for(int i = 0; i < temp_counter; i++)
        free(temps[i]);
}
