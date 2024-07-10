#!/bin/bash

# Τρέχουμε το πρόγραμμα memory_stress_lim με διαφορετικά μεγέθη μνήμης και συλλέγουμε στατιστικά με το perf

# Εκτέλεση με μέγεθος μνήμης 100
./memory_stress_lim 100 1000 &
MEMORY_STRESS_LIM_PID=$!
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses -p $MEMORY_STRESS_LIM_PID

# Εκτέλεση με μέγεθος μνήμης 200
./memory_stress_lim 200 1000 &
MEMORY_STRESS_LIM_PID=$!
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses -p $MEMORY_STRESS_LIM_PID

# Εκτέλεση με μέγεθος μνήμης 400
./memory_stress_lim 400 1000 &
MEMORY_STRESS_LIM_PID=$!
perf stat -e instructions,branches,branch-misses,cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,L1-icache-load-misses,dTLB-loads,dTLB-load-misses,iTLB-loads,iTLB-load-misses -p $MEMORY_STRESS_LIM_PID
