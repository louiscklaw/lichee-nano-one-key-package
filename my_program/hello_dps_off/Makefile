CC=arm-linux-gcc

hello_uart_off: hello_uart_off.o
	$(CC) $(LDFLAGS) hello_uart_off.o -o hello_uart_off

hello_uart_off.o: hello_uart_off.c
	$(CC) $(CFLAGS) -c hello_uart_off.c

clean:
	rm *.o hello_uart
