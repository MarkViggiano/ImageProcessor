CC=gcc
CFLAGS=-Wall -std=c99 -w -m32
LIBS=-lm #-ljpeg -lpng -ltiff
INCLUDES=-I./stb_image
SRC=./src/imageutil.c ./src/main.c# ./src/helpers.c
OBJS=$(SRC:.c=.o)

TARGET=imageutil

all: $(TARGET)

$(TARGET): $(OBJS) ./src/main.o ./src/helpers.o
	$(CC) $(CFLAGS) $(INCLUDES) $^ -o $@ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS) ./src/main.o $(TARGET)
