# Password Strength Checker

C-CS214 project: check one password, display its strength, then wait for Enter before closing.

The checker awards one point each for length of at least 8 characters, lowercase, uppercase, digits, and symbols. Scores of 0–2 are weak, 3–4 are moderate, and 5 is strong. Use 4 to 64 characters without spaces.

## Build on Windows

With MinGW-w64 GCC on your `PATH`:

```powershell
gcc -std=c11 -Wall -Wextra main.c -o PasswordStrengthChecker.exe
.\PasswordStrengthChecker.exe
```

`main.s` is unoptimized x86-64 Windows assembly in Intel syntax. The `-fno-builtin-printf` flag keeps GCC from replacing fixed-string `printf` calls with `puts`. To regenerate and build it:

```powershell
gcc -std=c11 -O0 -fno-builtin-printf -masm=intel -S main.c -o main.s
gcc main.s -o PasswordStrengthChecker-asm.exe
```
