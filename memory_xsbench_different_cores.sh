#!/bin/bash

# Εκτέλεση του memory_stress και του ./XSBench σε διαφορετικούς πυρήνες

# Μέγεθος μνήμης: 100
taskset -c 0 ./memory_stress 100 &
MEMORY_STRESS_PID=$!
taskset -c 1 perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 1
kill -SIGINT $MEMORY_STRESS_PID

# Μέγεθος μνήμης: 200
taskset -c 0 ./memory_stress 200 &
MEMORY_STRESS_PID=$!
taskset -c 1 perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 1
kill -SIGINT $MEMORY_STRESS_PID

# Μέγεθος μνήμης: 400
taskset -c 0 ./memory_stress 400 &
MEMORY_STRESS_PID=$!
taskset -c 1 perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses ./XSBench -t 1
kill -SIGINT $MEMORY_STRESS_PID
