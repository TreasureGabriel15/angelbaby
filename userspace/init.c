#include <stdio.h>
#include <unistd.h>
#include <sys/mount.h>

int main(void) {
    printf("Welcome. Take your time.\n");

    mount("proc", "/proc", "proc", 0, NULL);
    mount("sysfs", "/sys", "sysfs", 0, NULL);

    execl("/bin/sh", "sh", (char *)NULL);

    perror("could not start shell");
    while (1) sleep(1000);
}