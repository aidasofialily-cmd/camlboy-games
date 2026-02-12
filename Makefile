# Find all .asm files in subdirectories
SOURCES := $(wildcard games/**/*.asm)
ROMS    := $(SOURCES:.asm=.gb)

all: $(ROMS)

%.gb: %.asm
	rgbasm -L -o $*.o $<
	rgblink -o $@ $*.o
	rgbfix -v -p 0xFF $@
	rm $*.o

clean:
	rm -f games/**/*.gb
