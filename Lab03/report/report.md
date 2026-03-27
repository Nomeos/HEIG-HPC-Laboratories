# Lab 03 Report

## Introduction

## Methodology
Every code snippet are created coming from my imagination, and then when I had the code, I used the `-S` flag to get the assembly code with the proper optimization level. From that I use an online tool to convert the assembly code into C code. [Converter](https://www.codeconvert.ai/assembly-to-c-converter)

## Codes

### First Code
[First](https://godbolt.org/z/TPhGbT7jo)

In the case, we can see that the unoptimized code has a lot of redundant calculations, while the manually optimized code is more concise. Though, the compiler optimized code make us see that the first version is already optimized, and the second version is not really optimized.

The purpose was to see how the compiler can optimize redundancy in the code.

### Second Code

[Second](https://godbolt.org/z/66sEYPrhG)

In this case, the unoptimized code can make a lot of access to memory, while the manually optimized code is thought to reduce the number of memory access, but the compiler optimized code remove the unnecessary typedef and make the code more concise and efficient by directly updating the structure without the need of a temporary variable.

## Third Code

``` C
// Unoptimized code
void foo(int *a, int i) {
    a[i] = a[i] + 1;
    a[i] = a[i] * 2;
}

// Manually optimized code
void foo(int *a, int i) {
    int tmp = a[i];
    tmp = (tmp + 1) * 2;
    a[i] = tmp;
}

// Compiler optimized code (with -O2 flag)
void foo(int *arr, int index) {
    int val = arr[index];
    arr[index] = 2 * val + 2;
}
```

## Conclusion
