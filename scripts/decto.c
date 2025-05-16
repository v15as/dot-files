#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>
#include <errno.h>

void reverse(char *bin, int left, int right){
    while(left < right){
        char temp = bin[left];
        bin[left] = bin[right];
        bin[right] = temp;
        left++;
        right--;
    }
}

char* toBinary(int n){
    if (n == 0) {
        char *bin = (char *)malloc(2 * sizeof(char));
        strcpy(bin, "0");
        return bin;
    }
    char* bin = (char *) malloc(32 * sizeof(char));
    int index = 0;
    while(n > 0){
        if(n & 1)
            bin[index++] = '1';
        else
            bin[index++] ='0';
        n = n >> 1;
    }
    bin[index] = '\0';
    reverse(bin, 0, index - 1);
    return bin;
}



int isNumber(const char *str) {
    if (*str == '\0') return 0;  // Empty string is not a number

    char *endptr;
    errno = 0; // Reset error flag
    long num = strtol(str, &endptr, 10);

    if (errno == ERANGE || num > INT_MAX || num < 0) return 0; // Out of range or negative
    if (*endptr != '\0') return 0; // Non-numeric characters found

    return 1;
}

int main(int argc, char **argv){
    if(argc == 1){
        printf("Needs an argument. See --help\n");
        return 0;
    }
    else if(argc == 2){
        if(!strcmp(argv[1], "-h") || !(strcmp(argv[1],"--help"))){
            printf("decto [OPTIONS] value\n");
            printf("\n");
            printf("-h or --help            Display this message\n");
            printf("-b or --binary          Converts to binary\n");
            printf("-x or --hexadecimal     Converts to hexadecimal\n");
        }
        else    printf("Invalid format. Use --help to see how to use it\n");
        return 0;
    }
    if (!isNumber(argv[2])) {
        printf("Invalid number input.\n");
        return 0;
    }

    int num = atoi(argv[2]);

    if(!strcmp(argv[1],"-b") || !strcmp(argv[1],"--binary")){
        if(num < 0){
            printf("It doesn't process negative numbers for now :(\n");
            return 0;
        }
        printf("%s\n",toBinary(num));
    } else if(!strcmp(argv[1],"-x") || !strcmp(argv[1], "--hexadecimal")){
        printf("%x\n",num);
    } else{
        printf("Invalid option. Use --help to see how to use it\n");
    }

    return 0;
}
