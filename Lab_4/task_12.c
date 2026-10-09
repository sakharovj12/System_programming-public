#include <stdio.h>

int main(void) {
    long long n = 0;
    long long count = 0;

    if (scanf("%lld", &n) != 1 || n <= 0) {
        return 1;
    }

    for (long long i = 1; i <= n; i++) {
        if ((i % 5 == 0) && (i % 3 != 0) && (i % 7 != 0)) {
            count++;
        }
    }

    printf("%lld\n", count);
    return 0;
}
