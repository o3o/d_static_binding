libclib.a: clib.o
	ar rcs $@ $^

clib.o: clib.c
	gcc -c $< -o $@

clean:
	rm -f *.o *.a 
