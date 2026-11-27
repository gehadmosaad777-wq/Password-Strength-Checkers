#include <stdio.h>
#include <string.h>

#define SIZE      64
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

void clear_input(void) {
    int c = getchar();

    while (c != '\n' && c != EOF) c = getchar();
}

int is_english(const char *pass) {
    int i = 0;

    while (pass[i] != '\0') {
        if (pass[i] < 32 || pass[i] > 126 || pass[i] == '?') return 0;
        i++;
    }
    return 1;
}

int main(void) {
    char pass[SIZE];
    char choice;
    int score, done = 0;

    printf("PASSWORD STRENGTH CHECKER\n"
           "Rules (1 point each):\n"
           "  1. At least 8 characters\n"
           "  2. A lowercase letter\n"
           "  3. An uppercase letter\n"
           "  4. A digit\n"
           "  5. A special character (! @ # $ ...)\n");

    do {
        printf("\n1. Check a password\n"
               "2. Exit\n"
               "Your choice: ");
        if (scanf(" %c", &choice) != 1) break;
        clear_input();

        if (choice == '1') {
            printf("Enter a password (no spaces, max 63 chars): ");
            if (scanf("%63s", pass) != 1) break;

            if (getchar() != '\n') {
                clear_input();
                printf("No spaces allowed (and max 63 characters). Please try again.\n");
            } else if (!is_english(pass)) {
                printf("Use English letters, numbers and symbols only.\n");
            } else if (strlen(pass) < MIN_OK) {
                printf("Too short! Use at least %d characters.\n", MIN_OK);
            } else {
                score = analyze_password(pass);
                if (score <= 2) printf("Result : WEAK\n");
                else if (score <= 4) printf("Result : MODERATE\n");
                else {
                    printf("Result : STRONG\n");
                    done = 1;
                }
            }
        } else if (choice == '2') {
            printf("Goodbye!\n");
            done = 1;
        } else printf("Invalid choice, please enter 1 or 2.\n");
    } while (!done);

    return 0;
}
