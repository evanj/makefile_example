exe: exe.c
	gcc -MMD -MF exe.d -o $@ $<
-include exe.d

clean:
	rm -f exe.d exe
