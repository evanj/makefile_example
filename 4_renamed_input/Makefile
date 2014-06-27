exe: exe.c
	gcc -MMD -MP -MF exe.d -o $@ $<
-include exe.d

clean:
	rm -f exe.d exe
