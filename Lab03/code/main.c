#include <stdio.h>

int compute2(int x) {
    int tmp = x*x;
    return tmp + tmp + tmp;
}

typedef struct {
    int x, y;
} Point;

void sum(int *arr, int n, int *result) {
    int tmp = *result;

    for (int i = 0; i < n; i++) {
        tmp += arr[i];
    }

    *result = tmp;
}

void foo(int *a, int i) {
    int tmp = a[i];
    tmp = (tmp + 1) * 2;
    a[i] = tmp;
}


int main() {
    int arr[5] = {1, 2, 3, 4, 5};
    int result = 0;
    sum(arr, 5, &result);
    printf("Result: %d\n", result);
    return 0;
}