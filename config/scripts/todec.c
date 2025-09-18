#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>

int isValidBinary(const char *str) {
    if (*str == '\0') return 0; // String vazia não é válida
    while (*str) {
        if (*str != '0' && *str != '1') return 0; // Apenas 0 e 1 são permitidos
        str++;
    }
    return 1;
}

int isValidHexadecimal(const char *str) {
    if (*str == '\0') return 0; // String vazia não é válida
    while (*str) {
        if (!isxdigit(*str)) return 0; // Apenas caracteres hexadecimais são permitidos
        str++;
    }
    return 1;
}

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("Needs an argument. See --help\n");
        return 0;
    } else if (argc == 2) {
        if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help")) {
            printf("todec [OPTIONS] value\n\n");
            printf("-h or --help            Display this message\n");
            printf("-b or --binary          Converts from binary\n");
            printf("-x or --hexadecimal     Converts from hexadecimal\n");
        } else {
            printf("Invalid format. Use --help to see how to use it\n");
        }
        return 0;
    }

    char *endptr;
    errno = 0;
    long result;

    if (!strcmp(argv[1], "-b") || !strcmp(argv[1], "--binary")) {
        if (!isValidBinary(argv[2])) {
            printf("Invalid binary input.\n");
            return 0;
        }
        result = strtol(argv[2], &endptr, 2);
    } 
    else if (!strcmp(argv[1], "-x") || !strcmp(argv[1], "--hexadecimal")) {
        if (!isValidHexadecimal(argv[2])) {
            printf("Invalid hexadecimal input.\n");
            return 0;
        }
        result = strtol(argv[2], &endptr, 16);
    } 
    else {
        printf("Invalid option. Use --help to see how to use it\n");
        return 0;
    }

    if (errno == ERANGE || result > LONG_MAX) {
        printf("Number out of range.\n");
        return 0;
    }

    printf("%ld\n", result);
    return 0;
}
