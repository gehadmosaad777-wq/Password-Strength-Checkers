#include <stdio.h>

#define BUFFER_SIZE   64
#define MIN_LENGTH     8
#define TYPE_LOWER     1
#define TYPE_UPPER     2
#define TYPE_DIGIT     3
#define TYPE_SPECIAL   4

int char_type(char c) {
    if (c >= 'a' && c <= 'z') return TYPE_LOWER;
    else if (c >= 'A' && c <= 'Z') return TYPE_UPPER;
    else if (c >= '0' && c <= '9') return TYPE_DIGIT;
    else return TYPE_SPECIAL;
}

int get_score(const char *password) {
    int has_lower = 0, has_upper = 0, has_digit = 0, has_special = 0;
    int score = 0;
    int i = 0;

    while (password[i] != '\0') {
        int type = char_type(password[i]);

        if (type == TYPE_LOWER) has_lower = 1;
        else if (type == TYPE_UPPER) has_upper = 1;
        else if (type == TYPE_DIGIT) has_digit = 1;
        else has_special = 1;
        i++;
    }

    if (i >= MIN_LENGTH) score++;
    if (has_lower) score++;
    if (has_upper) score++;
    if (has_digit) score++;
    if (has_special) score++;
    return score;
}

int main(void) {
    char password[BUFFER_SIZE];
    int score;

    printf("Enter a password: ");
    scanf("%63s", password);

    score = get_score(password);
    printf("Score  : %d / 5\n", score);

    if (score <= 2) printf("Result : WEAK\n");
    else if (score <= 4) printf("Result : MODERATE\n");
    else printf("Result : STRONG\n");

    return 0;
}