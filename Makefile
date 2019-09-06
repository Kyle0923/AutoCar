ARTIFACT = build/main.exe

INC += -I./include
SRC += $(wildcard src/*.cpp)
OBJ += $(patsubst src/%.cpp, build/temp/%.o, $(SRC))
LIB +=

CC=g++
CFLAGS=-c -Wall
LDFLAGS=

all: $(ARTIFACT)

build/temp/%.o:src/%.cpp
	$(CC) $(CFLAGS) $(INC) $< -o $@

$(ARTIFACT): $(OBJ) 
	$(CC) $(LDFLAGS) $(LIB) $(OBJ) -o $@