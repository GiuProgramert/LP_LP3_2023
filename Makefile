# This Makefile compiles individual C files and places executables in a build directory

# Compiler to use
CC = gcc

# Flags for the compiler (optional)
CFLAGS = -Wall -g

# Source directory
SRC_DIR = src

# Build directory
BUILD_DIR = build

# List of source files
SRCS := $(shell find src -type f -name 'listing_*.*')

# List of source file basenames
BASENAMES = $(notdir $(SRCS))
EXECS = $(BASENAMES:.c=)

# Build targets
.PHONY: all clean

listing%:
	$(eval listing = $(@))
	$(eval dir = $(shell find src -type f -name $(listing).c))
	$(eval parent_dir = $(shell dirname $(dir)))
	$(eval new_dir = $(BUILD_DIR)/$(parent_dir))
	mkdir -p $(new_dir)
	$(CC) $(CFLAGS) $(dir) -o "$(new_dir)/$@"

all: $(SRCS)
	mkdir -p $(BUILD_DIR)/all
	$(CC) $(CFLAGS) $(SRCS) -o "$(BUILD_DIR)"

clean:
	rm -rf $(BUILD_DIR)
