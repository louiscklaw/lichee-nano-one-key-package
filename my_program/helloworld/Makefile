
helloworld: helloworld.o
	arm-linux-gcc helloworld.o -o helloworld
	cp helloworld ../../output/overlay

helloworld.o: helloworld.c
	arm-linux-gcc -c helloworld.c

clean:
	rm *.o helloworld
