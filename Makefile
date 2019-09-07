#Config
CONFIG ?= release

#Paths
OUT_PATH = build
TEMP_PATH = $(OUT_PATH)/temp
SRC_PATH = src

#artifact
ARTIFACT = $(OUT_PATH)/main.exe

INC += -I./include
SRC += $(wildcard $(SRC_PATH)/*.cpp)
OBJ += $(patsubst $(SRC_PATH)/%.cpp, $(TEMP_PATH)/%.o, $(SRC))
LIB +=

CC=g++
CXXFLAGS=-Wall
LDFLAGS=

ifeq ($(CONFIG), release)
	CXXFLAGS += -O3
else ifeq ($(CONFIG), debug)
	CXXFLAGS += -g
else ifeq ($(CONFIG), opt_debug)
	CXXFLAGS += -g -O3
endif

all: $(TEMP_PATH) $(ARTIFACT)

clean:
	rm -fr $(TEMP_PATH)/*
	rm -f $(ARTIFACT)

$(TEMP_PATH)/%.o:$(SRC_PATH)/%.cpp
	$(CC) -c $(CXXFLAGS) $(INC) $< -o $@

$(ARTIFACT): $(OBJ) 
	$(CC) $(LDFLAGS) $(LIB) $(OBJ) -o $@

$(TEMP_PATH):
	mkdir -p $(TEMP_PATH)