TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

# Default rule
run: clean default
	./$(TARGET)
#	./$(TARGET) -f ./mynewdb.db -n
#	./$(TARGET) -f ./mynewdb.db -a "Timmy H.,123 Sheshire Ln.,120"

default: $(TARGET)

# Clean rule
clean:
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

# Link target
$(TARGET): $(OBJ) | bin
	gcc -o $@ $^

# Compile .c to .o, ensure obj/ exists first
obj/%.o: src/%.c | obj
	gcc -c $< -o $@ -Iinclude

# Ensure bin and obj directories exist
bin:
	mkdir -p bin

obj:
	mkdir -p obj


