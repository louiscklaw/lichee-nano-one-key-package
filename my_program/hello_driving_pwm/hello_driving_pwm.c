#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

const int FD_OPEN_ERROR = -1;

const char * sound_bee = "2000000";
const char * sound_bu =  "1000000";

int open_file(char * file_path){

	int fd = FD_OPEN_ERROR;
	fd = open(file_path, O_WRONLY);

	printf("open ");
	printf(file_path);
	printf("\n");

	if (fd == FD_OPEN_ERROR){
		printf("open file error\n");
		return -1;
	}else{
		printf("open file done\n");
		printf("%d", fd);
		return fd;
	}
}

int main(void) {
	int fd_pwm_export = FD_OPEN_ERROR;
	int fd_pwm_unexport = FD_OPEN_ERROR;
	int fd_pwm_enable = FD_OPEN_ERROR;
	int fd_pwm_period = FD_OPEN_ERROR;
	int fd_pwm_dutycycle = FD_OPEN_ERROR;


	fd_pwm_export = open_file("/sys/class/pwm/pwmchip0/export");
	fd_pwm_unexport = open_file("/sys/class/pwm/pwmchip0/unexport");
	fd_pwm_enable = open_file("/sys/class/pwm/pwmchip0/pwm1/enable");
	fd_pwm_period = open_file("/sys/class/pwm/pwmchip0/pwm1/period");
	fd_pwm_dutycycle = open_file("/sys/class/pwm/pwmchip0/pwm1/duty_cycle");

  if ( fd_pwm_enable < 0 ) {
		printf("Error sync value\n");
		return -1;
  }else{



		write(fd_pwm_period, "2000000", 14);
		write(fd_pwm_dutycycle, "1000000", 14);


		write(fd_pwm_enable, "1", 2);

		sleep(1);

		write(fd_pwm_enable, "0", 2);


		close(fd_pwm_export);
		close(fd_pwm_unexport);
		close(fd_pwm_dutycycle);
		close(fd_pwm_period);
		close(fd_pwm_enable);

		return(EXIT_SUCCESS);
	}


}
