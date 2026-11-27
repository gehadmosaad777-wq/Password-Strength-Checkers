#include <stdio.h>
#include <string.h>

#define SIZE      65
#define MIN_LEN    8
#define MIN_OK     4
#define LOWER      1
#define UPPER      2
#define DIGIT      3
#define SPECIAL    4

int char_type(char c) {
    if (c >= 'a' && c <= 'z') return LOWER;
    else if (c >= 'A' && c <= 'Z') return UPPER;
    else if (c >= '0' && c <= '9') return DIGIT;
    else return SPECIAL;
}

int analyze_password(const char *pass) {
    int lower = 0, upper = 0, digit = 0, special = 0, score = 0, i = 0;

    while (pass[i] != '\0') {
        int type = char_type(pass[i]);

        if (type == LOWER) lower = 1;
        else if (type == UPPER) upper = 1;
        else if (type == DIGIT) digit = 1;
        else special = 1;
        i++;
    }

    if (i >= MIN_LEN) score++;
    else printf("  - Use at least 8 characters\n");
    if (lower) score++;
    else printf("  - Add a lowercase letter\n");
    if (upper) score++;
    else printf("  - Add an uppercase letter\n");
    if (digit) score++;
    else printf("  - Add a digit\n");
    if (special) score++;
    else printf("  - Add a special character (! @ # $ ...)\n");

    return score;
}

int main(void) {
    char pass[SIZE];
    int score;

    printf("PASSWORD STRENGTH CHECKER\n"
           "Rules (1 point each):\n"
           "  1. At least 8 characters\n"
           "  2. A lowercase letter\n"
           "  3. An uppercase letter\n"
           "  4. A digit\n"
           "  5. A special character (! @ # $ ...)\n");

    printf("Enter a password (no spaces, max 64 chars): ");
    if (scanf("%64s", pass) == 1) {
        if (getchar() != '\n') {
            scanf("%*[^\n]");
            getchar();
            printf("No spaces allowed (and max 64 characters). Please try again.\n");
        } else if (strlen(pass) < MIN_OK) {
            printf("Too short! Use at least %d characters.\n", MIN_OK);
        } else {
            score = analyze_password(pass);
            if (score <= 2) printf("Result : WEAK\n");
            else if (score <= 4) printf("Result : MODERATE\n");
            else printf("Result : STRONG\n");
        }
    }

    printf("\nPress Enter to close...\n");
    getchar();
    return 0;
}