#include <stdio.h>
#include <stdlib.h>

#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
// #include <termios.h>

#include <time.h>


int parameter_voltage;
int parameter_current;

int ii=0;
int test_int;
// int hello_test[];

void delay(int number_of_seconds)
{
    puts("starting delay\n");
    // Converting time into milli_seconds
    int milli_seconds = 1 * number_of_seconds;

    // Storing start time
    clock_t start_time = clock();

    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds)
        ;

    puts("delay done\n");
}

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

int change_voltage(char * value_input){
  printf("voltage to change: %s mV\n", value_input);
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
  printf("%02x\n", checksum_result & 0xff00 );
  printf("%02x\n", checksum_result & 0x00ff);

	// test_input[14] = 0x87;
	// test_input[15] = 0xd5;

	test_input[14] = checksum_result >> 8;
	test_input[15] = checksum_result & 0x00ff;

	// test_input[17] = 0x7f;

	// crc16(test_input, 18);
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

  // print hex for debug

  printf("%02x", command_start[0]);
  for (i=0;i<16;i++){
    printf("%02x", test_input[i]);
  }
  printf("%02x", command_end[0]);

  puts("\nvoltage change done\n");

  return EXIT_SUCCESS;
}

int change_current(char * value_input){
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

  printf("%02x", command_start[0]);
  for(i=0;i<16;i++)
  {
    printf("%02x", test_input[i]);
  }
  printf("%02x", command_end[0]);

  puts("\ncurrent change done\n");
  return EXIT_SUCCESS;
}


int ping_dps(void){
  puts("starting ping dps");
  unsigned short checksum_result;

  char command_start[1];
  command_start[0] = 0x7e;

  char command_end[1];
  command_end[0]=0x7f;

	char test_input[3];
	test_input[0 ] =  0x01;

  checksum_result = crc16(test_input, 1);

	test_input[1] = checksum_result >> 8;
	test_input[2] = checksum_result & 0x00ff;


  int fd;
  fd = open("/dev/ttyS1", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyS1 - ");
    return(-1);
  }

  fcntl(fd, F_SETFL, 0);

  write_to_the_port(fd, command_start[0]);
  int i = 0;
  for(i=0;i<3;i++)
  {
    write_to_the_port(fd, test_input[i]);
  }
  write_to_the_port(fd, command_end[0]);

  printf("%02x", checksum_result);

  delay(2);

  int n;
  char buf[256];
  n = read(fd, (void*)buf, 255);
  if (n < 0) {
    perror("Read failed - ");
    return -1;
  } else if (n == 0) printf("No data on port\n");
  else {
    buf[n] = '\0';
    printf("%i bytes read : %s", n, buf);
  }

  close(fd);



  puts("ping dps done");
  return EXIT_SUCCESS;
}

int main(int argc, char *argv[]) {
  if (argc == 3) {
    printf("No. of arguments : %d\n", argc);
    parameter_voltage = argv[1];
    parameter_current = argv[2];
    // printf("test voltage %04d\n", atoi(parameter_voltage));
    // printf("test current %04d\n", atoi(parameter_current));

    // change_voltage(parameter_voltage);
    // change_current(parameter_current);
    ping_dps();
  }else{
    puts("Please send command with the following format");
    puts("command example 1");
    puts("command example 2");
  }
  return EXIT_SUCCESS;
}