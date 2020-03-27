#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

int write_to_the_port(int fd, char * test_int){
  int n = write(fd, &test_int,1);
  if (n < 0) {
    perror("Write failed - ");
    return -1;
  }
  return 0;
}

int main(int argc, char ** argv) {
  int fd;
  // Open the Port. We want read/write, no "controlling tty" status, and open it no matter what state DCD is in
  fd = open("/dev/ttyS1", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyS1 - ");
    return(-1);
  }

  // Turn off blocking for reads, use (fd, F_SETFL, FNDELAY) if you want that
  fcntl(fd, F_SETFL, 0);

  // Write to the port
  // write_to_the_port(fd);
  char * test_char = 126;
  write_to_the_port(fd, 126);
  write_to_the_port(fd, 12);
  write_to_the_port(fd, 1);
  write_to_the_port(fd, 85);
  write_to_the_port(fd, 76);
  write_to_the_port(fd, 127);
  // write_to_the_port(fd, 's');
  // write_to_the_port(fd, 't');

  // // Read up to 255 characters from the port if they are there
  // char buf[256];
  // n = read(fd, (void*)buf, 255);
  // if (n < 0) {
  //   perror("Read failed - ");
  //   return -1;
  // } else if (n == 0) printf("No data on port\n");
  // else {
  //   buf[n] = '\0';
  //   printf("%i bytes read : %s", n, buf);
  // }

  // Don't forget to clean up
  close(fd);
  return 0;
}