CC = gcc
EXE_NAME = app
MAIN = main.c
LIB = linklayer
TX = /dev/ttyS10
RX = /dev/ttyS11
C_FLAGS = -g -Wall
ERROR = fake_error

default:
	$(CC) $(C_FLAGS) $(LIB).c -c
	$(CC) $(MAIN) $(LIB).o -o $(EXE_NAME)

error:
	$(CC) $(C_FLAGS) $(LIB).c -c
	$(CC) $(C_FLAGS) $(ERROR).c -c
	$(CC) $(MAIN) *.o -o $(EXE_NAME)	

tx:
	./$(EXE_NAME) $(TX)	tx	penguin.gif

rx:
	./$(EXE_NAME) $(RX)	rx	penguin-ultimate.gif

clear:
	rm -f $(EXE_NAME) a.out
	rm -f *.o
	rm -f penguin-ultimate.gif
