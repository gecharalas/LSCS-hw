#!/bin/bash

# Script για την εκτέλεση του perf stat με το XSBench με διαφορετικούς αριθμούς threads

# Εκτέλεση του perf stat με το XSBench με 1 thread
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 1

# Εκτέλεση του perf stat με το XSBench με 2 threads
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 2

# Εκτέλεση του perf stat με το XSBench με 4 threads
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 4
