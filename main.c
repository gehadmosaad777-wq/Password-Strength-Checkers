#include <stdio.h>
#include <string.h>
#include <time.h>

#define BUFFER_SIZE   64
#define MIN_LENGTH     8
#define MIN_ALLOWED    4
#define BASE_COUNT    10
#define KEY_COUNT     25
#define TYPE_LOWER     1
#define TYPE_UPPER     2
#define TYPE_DIGIT     3
#define TYPE_SPECIAL   4
#define USED_FILE     "used_passwords.txt"

static const char *base_passwords[BASE_COUNT] = {
    "Nile#2026", "Sky@Moon77", "Tiger!Run88", "Blue#Sky2026", "Cairo$Star905",
    "Falcon!Dream99", "Desert@Rain64#X", "Lotus$Wind382!Go", "Coffee&Code15!Time", "Pyramid#Giza26@Cairo"
};

/* char_type
   Purpose: find what kind of character it is.
   Input:   c = one character.
   Output:  1 lowercase, 2 uppercase, 3 digit, 4 special. */
int char_type(char c) {
    if (c >= 'a' && c <= 'z') return TYPE_LOWER;
    else if (c >= 'A' && c <= 'Z') return TYPE_UPPER;
    else if (c >= '0' && c <= '9') return TYPE_DIGIT;
    else return TYPE_SPECIAL;
}

/* analyze_password
   Purpose: give the password a score from 0 to 5 (1 point per rule)
            and print a hint for every rule that is missing.
   Input:   password = the password text.
   Output:  the score (0 to 5). */
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

/* shift_password
   Purpose: make a new password by moving every letter and digit forward
            by key places (z goes back to a, 9 goes back to 0).
   Input:   source = the original password, result = where to write the
            new one, key = how many places to move (1 to 25).
   Output:  nothing (the new password is written in result). */
void shift_password(const char *source, char *result, int key) {
    int i = 0;
    int moved;

    while (source[i] != '\0') {
        int type = char_type(source[i]);

        if (type == TYPE_LOWER) {
            moved = source[i] - 'a' + key;
            while (moved >= 26) moved = moved - 26;
            result[i] = moved + 'a';
        } else if (type == TYPE_UPPER) {
            moved = source[i] - 'A' + key;
            while (moved >= 26) moved = moved - 26;
            result[i] = moved + 'A';
        } else if (type == TYPE_DIGIT) {
            moved = source[i] - '0' + key;
            while (moved >= 10) moved = moved - 10;
            result[i] = moved + '0';
        } else result[i] = source[i];
        i++;
    }
    result[i] = '\0';
}

/* password_is_taken
   Purpose: check if a password is already saved in the used-passwords file.
   Input:   candidate = the password to look for.
   Output:  1 if it is in the file, 0 if not (or the file does not exist). */
int password_is_taken(const char *candidate) {
    FILE *file = fopen(USED_FILE, "r");
    char line[BUFFER_SIZE];
    int taken = 0;

    if (file == NULL) return 0;
    while (fscanf(file, "%63s", line) == 1) {
        if (strcmp(candidate, line) == 0) taken = 1;
    }
    fclose(file);
    return taken;
}

/* save_password
   Purpose: add a password at the end of the used-passwords file.
   Input:   password = the password to save.
   Output:  nothing. */
void save_password(const char *password) {
    FILE *file = fopen(USED_FILE, "a");

    if (file != NULL) {
        fprintf(file, "%s\n", password);
        fclose(file);
    }
}

/* clear_input
   Purpose: throw away the rest of the typed line.
   Input:   nothing (reads the keyboard).
   Output:  nothing. */
void clear_input(void) {
    int c = getchar();

    while (c != '\n' && c != EOF) c = getchar();
}

/* to_lowercase
   Purpose: change every capital letter in a text to a small letter.
   Input:   text = the text to change (changed in place).
   Output:  nothing. */
void to_lowercase(char *text) {
    int i = 0;

    while (text[i] != '\0') {
        if (text[i] >= 'A' && text[i] <= 'Z') text[i] = text[i] - 'A' + 'a';
        i++;
    }
}

/* ask_yes_no
   Purpose: ask the user for y/yes or n/no, and repeat until valid.
   Input:   nothing (reads the keyboard).
   Output:  1 for yes, 0 for no (also 0 if the input ends). */
int ask_yes_no(void) {
    char answer[16];

    while (1) {
        if (scanf("%15s", answer) != 1) return 0;
        clear_input();
        to_lowercase(answer);
        if (strcmp(answer, "y") == 0 || strcmp(answer, "yes") == 0) return 1;
        if (strcmp(answer, "n") == 0 || strcmp(answer, "no") == 0) return 0;
        printf("Invalid input. Please enter y or n: ");
    }
}

/* suggest_password
   Purpose: suggest a password made from a base password and a key from
            the clock. If it was used before, try the next key.
            Then ask the user if they want it.
   Input:   nothing.
   Output:  1 if the user accepted the suggestion, 0 if not. */
int suggest_password(void) {
    char result[BUFFER_SIZE];
    int key = (int)(time(NULL) % KEY_COUNT) + 1;
    int tries = 0;

    shift_password(base_passwords[key % BASE_COUNT], result, key);
    while (password_is_taken(result) && tries < KEY_COUNT) {
        key = key % KEY_COUNT + 1;
        shift_password(base_passwords[key % BASE_COUNT], result, key);
        tries++;
    }

    printf("\nSuggested password: %s\n", result);
    printf("Do you want to use it? (y/n): ");

    if (ask_yes_no()) {
        if (analyze_password(result) == 5) printf("\nResult : STRONG\n");
        printf("Great choice! Your password is %s\n", result);
        save_password(result);
        return 1;
    }
    printf("\nOK. Type your own password (1) or exit (3).\n");
    return 0;
}

/* main
   Purpose: show the menu and run the program until the user is done.
   Input:   nothing.
   Output:  0 when the program ends normally. */
int main(void) {
    char password[BUFFER_SIZE];
    char choice;
    int score, finished = 0;

    printf("=========================================\n"
           "        PASSWORD STRENGTH CHECKER\n"
           "=========================================\n"
           "Rules (1 point each):\n"
           "  1. At least 8 characters\n"
           "  2. A lowercase letter\n"
           "  3. An uppercase letter\n"
           "  4. A digit\n"
           "  5. A special character (! @ # $ ...)\n");

    do {
        printf("-----------------------------------------\n"
               "  1. I will type my own password\n"
               "  2. Suggest a password for me\n"
               "  3. Exit\n"
               "Your choice: ");
        scanf(" %c", &choice);
        clear_input();

        if (choice == '1') {
            printf("\nEnter a password (no spaces, max 63 chars): ");
            scanf("%63s", password);

            if (getchar() != '\n') {
                clear_input();
                printf("\nNo spaces allowed (and max 63 characters). Please try again.\n");
            } else if (strlen(password) < MIN_ALLOWED) {
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
