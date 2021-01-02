#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int check(float bus[], int offset[], int len) {
    for (int i = 1; i <= len; i++) {
        if (bus[i] - offset[i] != bus[i-1] - offset[i-1]) {
            return -1;
        }
    }
    return 0;
}

int main() {
    FILE* fp;
    char buff[256];

    fp = fopen("in.13", "r");
    fgets(buff, 255, (FILE*)fp);

    int start = atoi(buff);

    fgets(buff, 255, (FILE*)fp);
    fclose(fp);
    
    int busses[128];
    int busPos[128];

    char* c = buff;
    char bus[128]; bus[0] = '\0';
    int ptr = 0;
    int busPtr = 0;
    while (*c) {
        if (*c == 'x') {
            c++;
            continue;
        }
        if (*c == ',') {
            if (*bus) {
                busses[ptr] = atoi(bus);
                busPos[ptr] = busPtr;
                ptr++;
                bus[0] = '\0';
            }
            c++;
            busPtr++;
            continue;
        }
        strncat(bus, c, 1);
        c++;
    }
    if (*bus) {
        busPos[ptr] = busPtr++;
        busses[ptr] = atoi(bus);
    }

    int min = 2147483647;
    int minBus = -1;
    for (int i = 0; i <= ptr; i++) {
        int val = busses[i] - (start % busses[i]);
        if (val < min) {
            min = val;
            minBus = busses[i];
        }
    }
    printf("Part 1: %d\n", minBus * min);

    // some LCM, but weirdly..
    //  avoiding prime factorisation and doing it the slow way
    //  EDIT: turns out slow is too slow - giving up
    float sharedTime[128];
    for (int i = 0; i <= ptr; i++) {
        sharedTime[i] = busses[i]; 
    }

    while (check(sharedTime, busPos, ptr)) {
        // find smallest, and add itself
        float smallestBus = sharedTime[0];
        int smallestPlace = 0;
        for (int i = 1; i <= ptr; i++) {
            if (sharedTime[i] < smallestBus) {
                smallestBus = sharedTime[i];
                smallestPlace = i;
            }
        }
        if (smallestBus < 0) {
            printf("smollest %f\n", smallestBus);
            break;
        }
        sharedTime[smallestPlace] += busses[smallestPlace];
    }

    printf("Part 2: %f\n", sharedTime[0]);

}

