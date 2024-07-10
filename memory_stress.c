#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <signal.h>
#include <unistd.h>
#include <time.h>

volatile int keepRunning = 1;

void intHandler(int dummy) {
    keepRunning = 0;
}

void initialize_memory(int *arr, size_t size) {
    for (size_t i = 0; i < size / sizeof(int); i++) {
        arr[i] = rand();
    }
}

void stress_memory(int *arr, size_t size) {
    while (keepRunning) {
        for (size_t i = 0; i < size / sizeof(int); i++) {
            arr[i] = arr[i] * 2;
        }
    }
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <size_in_megabytes>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    size_t size = atoi(argv[1]) * 1024 * 1024;
    int *arr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

    if (arr == MAP_FAILED) {
        perror("mmap");
        exit(EXIT_FAILURE);
    }

    srand(time(NULL));
    initialize_memory(arr, size);

    signal(SIGINT, intHandler);
    stress_memory(arr, size);

    if (munmap(arr, size) == -1) {
        perror("munmap");
        exit(EXIT_FAILURE);
    }

    return 0;
}
