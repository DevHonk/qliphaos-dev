SRC = 	src/kassert.c \
		src/kernel.c

OBJ = $(SRC:.c=.o)
OBJ_S = $(SRC:.S=.o)

all: $(OBJ) $(OBJ_S)

include ../../config.make

C_FLAVOR_FLAGS += -fno-stack-protector

INCLUDE_FLAGS += -I ../include