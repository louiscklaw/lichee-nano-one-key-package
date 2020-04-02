#include <stdio.h>
#include <stdlib.h>

#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

char * target_port;
int parameter_voltage;
int parameter_current;

int ii=0;
int test_int;
// int hello_test[];


int write_to_the_port(int fd, char * test_int){
  int n = write(fd, &test_int,1);
  if (n < 0) {
    perror("Write failed - ");
    return -1;
  }
  return 0;
}

unsigned short crc16(char *ptr, int count)
{
  int  crc;
  char i;
  crc = 0x0;
  while (--count >= 0)
  {
    crc = crc ^ (int) *ptr++ << 8;
    i = 8;
    do
    {
        if (crc & 0x8000)
          crc = crc << 1 ^ 0x1021;
        else
          crc = crc << 1;
    } while(--i);
  }
  return (crc);
}

int change_voltage(char * target_port, char * value_input){
  // printf("voltage to change: %s mV\n", value_input);

  unsigned short checksum_result;

  char command_start[1];
  command_start[0] = 0x7e;

  char command_end[1];
  command_end[0]=0x7f;

	char test_input[16];
	test_input[0 ] =  0x0e;
	test_input[1 ] =  0x76;
	test_input[2 ] =  0x6f;
	test_input[3 ] =  0x6c;
	test_input[4 ] =  0x74;
	test_input[5 ] =  0x61;
	test_input[6 ] =  0x67;
	test_input[7 ] =  0x65;
	test_input[8 ] =  0x00;
	test_input[9 ] = value_input[0];
	test_input[10] = value_input[1];
	test_input[11] = value_input[2];
	test_input[12] = value_input[3];
	test_input[13] = 0x00;

  checksum_result = crc16(test_input, 14);
  // unsigned short test1;
  // char test_checksum[4];
  // test1=0x1234;

  // printf("%04x", test1);
  // sprintf(test_checksum,"%x", );
  // test_checksum[0] = test1;
  // test_checksum[1] = test1 ;

  // printf("%02x\n", checksum_result & 0xff00 );
  // printf("%02x\n", checksum_result & 0x00ff);

	// test_input[14] = 0x87;
	// test_input[15] = 0xd5;

	test_input[14] = checksum_result >> 8;
	test_input[15] = checksum_result & 0x00ff;

	// test_input[17] = 0x7f;

	// crc16(test_input, 18);
  int fd;
  fd = open("/dev/ttyS1", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open target port - ");
    return(-1);
  }

  fcntl(fd, F_SETFL, 0);

  write_to_the_port(fd, command_start[0]);


  int i = 0;
  for(i=0;i<16;i++)
  {

    write_to_the_port(fd, test_input[i]);
  }
  write_to_the_port(fd, command_end[0]);

  close(fd);

  // print hex for debug

  // printf("%02x", command_start[0]);
  // for (i=0;i<16;i++){
  //   printf("%02x", test_input[i]);
  // }
  // printf("%02x", command_end[0]);

  return EXIT_SUCCESS;
}

int change_current(char * target_port, char * value_input){
  printf("current to change: %s\n", value_input);
  unsigned short checksum_result;

  char command_start[1];
  command_start[0] = 0x7e;

  char command_end[1];
  command_end[0]=0x7f;

	char test_input[16];
	test_input[0 ] =  0x0e;
	test_input[1 ] =  0x63;
	test_input[2 ] =  0x75;
	test_input[3 ] =  0x72;
	test_input[4 ] =  0x72;
	test_input[5 ] =  0x65;
	test_input[6 ] =  0x6e;
	test_input[7 ] =  0x74;
	test_input[8 ] =  0x00;
	test_input[9 ] = value_input[0];
	test_input[10] = value_input[1];
	test_input[11] = value_input[2];
	test_input[12] = value_input[3];
	test_input[13] = 0x00;

  checksum_result = crc16(test_input, 14);

	test_input[14] = checksum_result >> 8;
	test_input[15] = checksum_result & 0x00ff;

  int fd;
  fd = open("/dev/ttyS1", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyS1 - ");
    return(-1);
  }

  fcntl(fd, F_SETFL, 0);

  write_to_the_port(fd, command_start[0]);
  int i = 0;
  for(i=0;i<16;i++)
  {
    write_to_the_port(fd, test_input[i]);
  }
  write_to_the_port(fd, command_end[0]);

  close(fd);

  // printf("%02x", command_start[0]);
  // for(i=0;i<16;i++)
  // {
  //   printf("%02x", test_input[i]);
  // }
  // printf("%02x", command_end[0]);

  return EXIT_SUCCESS;
}

int main(int argc, char *argv[]) {
  if (argc == 4) {
    printf("No. of arguments : %d\n", argc);
    target_port = argv[1];
    parameter_voltage = argv[2];
    parameter_current = argv[3];
    // printf("test voltage %04d\n", atoi(parameter_voltage));
    // printf("test current %04d\n", atoi(parameter_current));

    change_voltage("/dev/ttyS1", parameter_voltage);
    usleep(200);
    change_current("/dev/ttyS1", parameter_current);

  }

  puts("{\"status\":\"done\"}");
  return EXIT_SUCCESS;
}