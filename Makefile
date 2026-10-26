CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lm

SRC_DIR = src
TARGET = bison-calc
OBJECTS = $(SRC_DIR)/bison-calc.tab.o $(SRC_DIR)/lex.yy.o $(SRC_DIR)/calc-funcs.o

.PHONY: all clean
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(SRC_DIR)/bison-calc.tab.c $(SRC_DIR)/bison-calc.tab.h &: $(SRC_DIR)/bison-calc.y
	bison -d -o $(SRC_DIR)/bison-calc.tab.c $(SRC_DIR)/bison-calc.y

$(SRC_DIR)/lex.yy.c: $(SRC_DIR)/bison-calc.l $(SRC_DIR)/bison-calc.tab.h
	flex -o $@ $(SRC_DIR)/bison-calc.l

$(SRC_DIR)/bison-calc.tab.o: $(SRC_DIR)/bison-calc.tab.c
	$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@

$(SRC_DIR)/lex.yy.o: $(SRC_DIR)/lex.yy.c
	$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@

$(SRC_DIR)/calc-funcs.o: $(SRC_DIR)/calc-funcs.c $(SRC_DIR)/bison-calc.h
	$(CC) $(CFLAGS) -I$(SRC_DIR) -c $< -o $@

clean:
	rm -f $(TARGET) $(SRC_DIR)/*.o $(SRC_DIR)/bison-calc.tab.c $(SRC_DIR)/bison-calc.tab.h $(SRC_DIR)/lex.yy.c
