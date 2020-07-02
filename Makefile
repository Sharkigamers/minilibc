##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

RM			=		rm -f

CC			=		ld

CCTEST		=		gcc

SRC			=		$(shell find ./src/ -name '*.asm')

OBJ			=		$(SRC:.asm=.o)

TESTOBJ		=		$(SRC:.asm=.asmo)

NAME		=		libasm.so

TESTNAME	=		unit_tests

%.o:	%.asm
		nasm -felf64 $< -o $@ -shared

%.asmo:	%.asm
		nasm -felf64 $< -o $@ -D DEBUG

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(OBJ) -o $(NAME) -shared -fno-builtin

tests_run:	$(TESTOBJ)
	$(CCTEST) -o $(TESTNAME) $(TESTOBJ) tests/unit_tests.c -lcriterion --coverage
	./$(TESTNAME) | gcovr

clean:
	$(RM) $(shell find ./src/ -name '*.o')
	$(RM) $(shell find ./src/ -name '*.asmo')
	rm -f $(shell find $(SOURCEDIR) -name '*~')
	rm -f $(shell find $(SOURCEDIR) -name '*#')
	rm -f $(shell find $(SOURCEDIR) -name '*vg*')
	rm -f $(shell find $(SOURCEDIR) -name '*.gc*')

fclean: clean
	rm -f $(NAME)
	rm -f $(TESTNAME)

re:	fclean all

.PHONY:	clean all re fclean
