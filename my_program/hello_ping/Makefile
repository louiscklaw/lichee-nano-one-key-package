CC=arm-linux-gcc

hello_ping: hello_ping.o
	$(CC) $(LDFLAGS) hello_ping.o -o hello_ping

hello_ping.o: hello_ping.c
	$(CC) $(CFLAGS) -c hello_ping.c

clean:
	rm *.o hello_ping
