CC=arm-linux-gcc

hello_uart: hello_uart.o
	$(CC) $(LDFLAGS) hello_uart.o -o hello_uart

hello_uart.o: hello_uart.c
	$(CC) $(CFLAGS) -c hello_uart.c

clean:
	rm *.o hello_uart
