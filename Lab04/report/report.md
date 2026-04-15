# Lab 04 Report

## Steps

### Running perf

I compiled the program with `cmake` and ran `perf record` to collect performance data.

```bash
mkdir build
cd build
cmake ..
make

perf record ./simd_demo 10000 10

perf annotate > perf_report.txt
```

The first version without optimization made 246 ms and the second version with the `-O2` optimization level made 44 ms. The improvement is significant, and we can see that the optimized version is much faster than the non-optimized version.

We can also see that the most time-consuming parts of the code are `the double loops` that perform the calculations but also the `branchings` that are used to check the conditions. In third place, we can see the `memory accesses` that are used to read and write data from memory.