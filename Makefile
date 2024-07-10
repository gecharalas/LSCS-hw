# Compiler
CC = gcc

# Compiler flags
CFLAGS = -O0 -Wall

# Targets
TARGETS = memory_stress memory_stress_lim

# Default target
all: $(TARGETS)

# Rule for memory_stress
memory_stress: memory_stress.c
	$(CC) $(CFLAGS) -o memory_stress memory_stress.c

# Rule for memory_stress_lim
memory_stress_lim: memory_stress_lim.c
	$(CC) $(CFLAGS) -o memory_stress_lim memory_stress_lim.c

# Clean up
clean:
	rm -f $(TARGETS)
	rm -f *.o

# Phony targets
.PHONY: all clean
