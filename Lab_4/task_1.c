#include <stdio.h>

int main(void) {
    int n = 0;

    if (scanf("%d", &n) != 1 || n <= 0) {
        return 1;
    }

    int result = n / 481;

    printf("%d\n", result);
    return 0;
}
