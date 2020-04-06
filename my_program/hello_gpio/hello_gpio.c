#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

// http://zero.lichee.pro/%E9%A9%B1%E5%8A%A8/GPIO_file.html#gpio

int main(void) {
  int fd = -1;
  // fd = open("/sys/class/gpio/export", O_WRONLY);
  // if (fd < 0) {
  //     GLib.stdout.printf("Error sync export\n");
  //     return;
  // }
  // write(fd, "31", 3);
  // close(fd);
  // fd = open("/sys/class/gpio/gpio31/direction", O_WRONLY);
  // if (fd < 0) {
  //     GLib.stdout.printf("Error sync direction\n");
  //     return;
  // }
  // write(fd, "out", 4);
  // close(fd);
  fd = open("/sys/class/gpio/gpio131/value", O_WRONLY);
  if (fd < 0) {
      printf("Error sync value\n");
      return -1;
  }

  while (1) {
    write(fd, "0", 2);
    usleep(1);
    write(fd, "1", 2);
    usleep(1);
  }

  close(fd);
	return(EXIT_SUCCESS);
}
