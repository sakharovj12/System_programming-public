#include <stdio.h>

int main(void) {
    int n = 0;
    int num = 0;
    int pos_count = 0;
    int neg_count = 0;

    if (scanf("%d", &n) != 1 || n <= 0) {
        return 1;
    }

    for (int i = 0; i < n; i++) {
        if (scanf("%d", &num) != 1) {
            return 1;
        }
        if (num > 0) {
            pos_count++;
        } else if (num < 0) {
            neg_count++;
        }
    }

    if (pos_count > neg_count) {
        printf("1\n");
    } else if (neg_count > pos_count) {
        printf("0\n");
    } else {
        printf("-1\n");
    }

    return 0;
}
