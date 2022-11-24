CC = gcc
AR = ar
FLAGS = -Wall -g -c
OBJECTS_MAIN = main.o
OBJECTS_BASIC = basicClassification.o
OBJECTS_ADVANCED_LOOP = advancedClassificationLoop.o
OBJECTS_ADVANCED_REC = advancedClassificationRecursion.o
LIB_D_REC = libclassrec.so
LIB_S_REC = libclassrec.a
LIB_D_LOOP = libclassloops.so
LIB_S_LOOP = libclassloops.a

main.o: main.c
	$(CC) $(FLAGS) main.c -o $(OBJECTS_MAIN)
	
loops: $(LIB_S_LOOP) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP)

$(OBJECTS_BASIC): basicClassification.c
	$(CC) $(FLAGS) basicClassification.c -o $(OBJECTS_BASIC)

$(OBJECTS_ADVANCED_LOOP): $(OBJECTS_ADVANCED_LOOP)
	$(CC) $(FLAGS) advancedClassificationLoop.c -o $(OBJECTS_ADVANCED_LOOP)

recursives: $(LIB_S_REC) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC)

$(OBJECTS_ADVANCED_REC): advancedClassificationRecursion.c
	$(CC) $(FLAGS) advancedClassificationRecursion.c -o $(OBJECTS_ADVANCED_REC)

recursived: $(LIB_D_REC) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC)

$(LIB_D_REC): $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC)
	$(CC) -shared $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC) -o $(LIB_D_REC)
	
loopd: $(LIB_D_LOOP) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP)

$(LIB_D_LOOP): $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP)
	$(CC) -shared $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP) -o $(LIB_D_LOOP)
	
$(LIB_S_REC): $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC)	
	$(AR) -rsc $(LIB_S_REC) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC)
	
$(LIB_S_LOOP): $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP)
	$(AR) -rsc $(LIB_S_LOOP) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_LOOP)

mains: $(OBJECTS_MAIN) $(OBJECTS_BASIC) $(OBJECTS_ADVANCED_REC) $(LIB_S_REC)
	$(CC) -o mains main.o $(LIB_S_REC) -lm
	
maindloop: $(OBJECTS_MAIN) $(LIB_D_LOOP) 
	$(CC) -o maindloop $(OBJECTS_MAIN) ./$(LIB_D_LOOP) -lm
	
maindrec: $(OBJECTS_MAIN) $(LIB_D_REC) 
	$(CC) -o maindrec $(OBJECTS_MAIN) ./$(LIB_D_REC) -lm

all:  loops loopd recursives recursived mains maindloop

.PHONY: clean all

clean: 
	rm -f *.o *.a *.so "maindloop" "maindrec" "mains"
	
	
	
	
	

