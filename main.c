#include <stdio.h>
#include <time.h>

#define BUFFER_SIZE   64
#define MIN_LENGTH     8
#define MIN_ALLOWED    4
#define BASE_COUNT    10
#define TYPE_LOWER     1
#define TYPE_UPPER     2
#define TYPE_DIGIT     3
#define TYPE_SPECIAL   4

static const char *base_passwords[BASE_COUNT] = {
    "Nile#2026", "Sky@Moon77", "Tiger!Run88", "Blue#Sky2026", "Cairo$Star905",
    "Falcon!Dream99", "Desert@Rain64#X", "Lotus$Wind382!Go", "Coffee&Code15!Time", "Pyramid#Giza26@Cairo"
};
static int round_count = 0;

int char_type(char c) {
    if (c >= 'a' && c <= 'z') return TYPE_LOWER;
    else if (c >= 'A' && c <= 'Z') return TYPE_UPPER;
    else if (c >= '0' && c <= '9') return TYPE_DIGIT;
    else return TYPE_SPECIAL;
}

int get_length(const char *text) {
    int n = 0;
    while (text[n] != '\0') n++;
    return n;
}

int analyze_password(const char *password) {
    int has_lower = 0, has_upper = 0, has_digit = 0, has_special = 0, score = 0, i = 0;

    while (password[i] != '\0') {
        int type = char_type(password[i]);

        if (type == TYPE_LOWER) has_lower = 1;
        else if (type == TYPE_UPPER) has_upper = 1;
        else if (type == TYPE_DIGIT) has_digit = 1;
        else has_special = 1;
        i++;
    }

    if (i >= MIN_LENGTH) score++;
    else printf("  - Use at least 8 characters\n");
    if (has_lower) score++;
    else printf("  - Add a lowercase letter\n");
    if (has_upper) score++;
    else printf("  - Add an uppercase letter\n");
    if (has_digit) score++;
    else printf("  - Add a digit\n");
    if (has_special) score++;
    else printf("  - Add a special character (! @ # $ ...)\n");

    return score;
}

void shift_password(const char *source, char *result, int key) {
    int i = 0;

    while (source[i] != '\0') {
        int type = char_type(source[i]);

        if (type == TYPE_LOWER) result[i] = (source[i] - 'a' + key % 26 + 26) % 26 + 'a';
        else if (type == TYPE_UPPER) result[i] = (source[i] - 'A' + key % 26 + 26) % 26 + 'A';
        else if (type == TYPE_DIGIT) result[i] = (source[i] - '0' + key % 10 + 10) % 10 + '0';
        else result[i] = source[i];
        i++;
    }
    result[i] = '\0';
}

int suggest_password(void) {
    char result[BUFFER_SIZE];
    char answer;
    int key, level, accepted = 0, done = 0;

    round_count++;
    key = (int)((time(NULL) + round_count) % 25) + 1;
    level = key % BASE_COUNT;

    while (!done) {
        shift_password(base_passwords[level], result, key);
        printf("\nSuggested password: %s\n", result);
        printf("  [a] Accept   [e] Easier   [h] Harder   [d] Different   [b] Back\n");
        printf("Your choice: ");
        scanf(" %c", &answer);
        while (getchar() != '\n');

        if (answer == 'a' || answer == 'A') {
            printf("\nAre you sure you want %s ? (y/n): ", result);
            scanf(" %c", &answer);
            while (getchar() != '\n');
            if (answer == 'y' || answer == 'Y') {
                if (analyze_password(result) == 5) printf("\nResult : STRONG\n");
                printf("Great choice! Your password is %s\n", result);
                accepted = 1;
                done = 1;
            }
        } else if (answer == 'e' || answer == 'E') {
            if (level > 0) level--;
            else printf("\nThis is already the easiest one.\n");
        } else if (answer == 'h' || answer == 'H') {
            if (level < BASE_COUNT - 1) level++;
            else printf("\nThis is already the hardest one.\n");
        } else if (answer == 'd' || answer == 'D') {
            round_count++;
            key = (int)((time(NULL) + round_count) % 25) + 1;
        } else if (answer == 'b' || answer == 'B') done = 1;
        else printf("\nInvalid choice.\n");
    }
    return accepted;
}

int main(void) {
    char password[BUFFER_SIZE];
    char choice;
    int score, next, finished = 0;

    printf("=========================================\n");
    printf("        PASSWORD STRENGTH CHECKER\n");
    printf("=========================================\n");
    printf("Rules (1 point each):\n");
    printf("  1. At least 8 characters\n");
    printf("  2. A lowercase letter\n");
    printf("  3. An uppercase letter\n");
    printf("  4. A digit\n");
    printf("  5. A special character (! @ # $ ...)\n");

    do {
        printf("-----------------------------------------\n");
        printf("  1. I will type my own password\n");
        printf("  2. Suggest a password for me\n");
        printf("  3. Exit\n");
        printf("Your choice: ");
        scanf(" %c", &choice);
        while (getchar() != '\n');

        if (choice == '1') {
            printf("\nEnter a password (no spaces, max 63 chars): ");
            scanf("%63s", password);
            next = getchar();

            if (next != '\n') {
                while (getchar() != '\n');
                printf("\nNo spaces allowed (and max 63 characters). Please try again.\n");
            } else if (get_length(password) < MIN_ALLOWED) {
                printf("\nToo short! Use at least %d characters, or choose 2 for a suggestion.\n", MIN_ALLOWED);
            } else {
                printf("\n");
                score = analyze_password(password);
                if (score <= 2) printf("Result : WEAK\n");
                else if (score <= 4) printf("Result : MODERATE\n");
                else {
                    printf("Result : STRONG\n");
                    printf("Great! Your password is accepted.\n");
                    finished = 1;
                }
            }
        } else if (choice == '2') finished = suggest_password();
        else if (choice == '3') {
            printf("\nGoodbye!\n");
            finished = 1;
        } else printf("\nInvalid choice, please enter 1, 2 or 3.\n");
    } while (!finished);

    printf("-----------------------------------------\n");
    return 0;
}