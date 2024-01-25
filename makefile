.PHONY: all clean loops recursives recursived loopd

# Programs to use
CC = gcc
AR = ar

# Flags setup
CFLAGS = -Wall -g
LFLAGS = -shared
SFLAGS = rcs
FP = -fPIC

# Build all programs
all: mains maindloop maindrec loops recursives recursived loopd

# Clean up the directory
clean:
	@rm -f mains maindloop maindrec *.o *.a *.so *.gch

loops: libclassloops.a
recursives: libclassrec.a
loopd: libclassloops.so
recursived: libclassrec.so


# The main program with static libary of recursive implametation
mains: main.o libclassrec.a
	$(CC) $(CFLAGS) $< ./libclassrec.a -o $@

# The main program with dynamic libary of loops implametation
maindloop: main.o libclassloops.so
	$(CC) $(CFLAGS) $< ./libclassloops.so -o $@

# The main program with dynamic libary of recursive implametation
maindrec: main.o libclassrec.so
	$(CC) $(CFLAGS) $< ./libclassrec.so -o $@


# Building all necessary libraries
libclassrec.so: advancedClassificationRecursion.o basicClassification.o
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

libclassloops.so: advancedClassificationLoop.o basicClassification.o
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

libclassloops.a: advancedClassificationLoop.o basicClassification.o
	$(AR) $(SFLAGS) $@ $^

libclassrec.a: advancedClassificationRecursion.o basicClassification.o
	$(AR) $(SFLAGS) $@ $^


# Compile all necessary object files
main.o: main.c NumClass.h
	$(CC) $(CFLAGS) -c $^

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -c $^ $(FP)

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -c $^ $(FP)

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -c $^ $(FP)

