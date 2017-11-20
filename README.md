Whole Lab Assignment is contained in the zip file "IIT2016106.zip"
Extract the zip file which contains four folder-
	1) Lab1_A which contains the xv6 version with process tracing
	2) Lab1_B which contains the xv6 version with halt system call implemented
	3) Lab2 which contains the xv6 version with Big data file implemented
	4) Lab4 which contains the xv6 version with shmget system call 

to run the Lab1_A version-:
	run "make"
	run "make qemu"
	it will list the system call name and its return value
	NOTE:
		The files i changed:
		1)syscall.c

to run the Lab1_B version-:
	run "make"
	run "make qemu"
	run "halt" to run the halt system call
	NOTE:
		The files i changed:
		1)Makefile
		2)Created halt.c
		3)sysproc.c
		4)syscall.h
		5)syscall.c
		6)user.h
		7)usys.S
		8)defs.h

to run the Lab4 version-:
	run "make"
	run "make qemu"
	run "shm_get" to run the shm_get system call
	NOTE:
		The files i changed:
		1)Makefile
		2)defs.h
		3)proc.c
		4)proc.h
		5)syscall.c
		6)syscall.h
		7)sysproc.h
		8)sysproc.c
		9)created shm_get.c
		10)user.h
		11)usys.S
		12)vm.c

to run the Lab2 version-:
	run "make"
	run "make qemu"
	run "big *"
	NOTE:
		The files i changed:
		1)Makefile
		2)mkfs.c
		3)fs.c
		4)fs.h
		5)param.h
		6)created big.c

