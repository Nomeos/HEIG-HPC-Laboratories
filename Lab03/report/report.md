# Lab 03 Report

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

[Third](https://godbolt.org/z/M71o8oTcE)

In this case, the unoptimized code is a simple function that checks if an array contains a zero by iterating through it. The manually optimized code is the same as the unoptimized code but it iterates through the array in chunks of 4 elements, which can reduce the number of iterations and potentially improve performance. The compiler optimized code is way less understandable for a human and also add a significant amount of code, which is not really optimized, but it is more efficient for the CPU.

## Conclusion

For those examples, I compiled the code with two different optimization levels :

- `-O2` for a first optimization level
- `-O3 -march=native` for a more aggressive optimization level and also to see if the compiler can optimize even more the code by using specific instructions for the architecture.

We saw that sometimes the code cannot be optimized by the compiler, and that the manually optimized code can be more efficient than the unoptimized code, but it is not always the case. The compiler can optimize a lot of things that we cannot see, and it can also make the code more concise and efficient by removing unnecessary code.