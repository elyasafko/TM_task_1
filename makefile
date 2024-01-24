.PHONY: all clean loops recursives recursived loopd

loops: libclassloops.a
recursives: libclassrec.a
loopd: libclassloops.so
recursived: libclassrec.so



libclassloops.a: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o 
	ranlib libclassloops.a

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o



mains: main.o libclassrec.a
	gcc -Wall -g main.o -L. ./libclassrec.a -o mains

maindloop: main.o libclassloops.so 
	gcc -Wall -g -o maindloop main.o ./libclassloops.so 

maindrec: main.o libclassrec.so
	gcc -Wall -g -o maindrec main.o ./libclassrec.so


all: mains maindloop maindrec

main.o: main.c NumClass.h
	gcc -Wall -c main.c

basicClassification.o: basicClassification.c
	gcc -Wall -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc -Wall -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	gcc -Wall -c advancedClassificationRecursion.c


clean:
	@rm -f *.o *.a *.so mains maindloop maindrec