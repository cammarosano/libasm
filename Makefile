# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rcammaro <rcammaro@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/22 13:46:21 by rcammaro          #+#    #+#              #
#    Updated: 2021/04/22 23:46:31 by rcammaro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_read.s  ft_strcmp.s  ft_strcpy.s  ft_strdup.s  ft_strlen.s  ft_write.s
OBJ = $(SRC:.s=.o)
NAME = libasm.a

SRC_DEMO = demo.c
OBJ_DEMO = demo.o
HEADER = libasm.h
DEMO = demo
CFLAGS = -Wall -Wextra -Werror

all:		$(NAME) $(DEMO)

$(NAME):	$(OBJ)
			ar -rcs $@ $^ 

%.o:		%.s
			nasm -felf64 $< -o $@ 

$(DEMO):	$(NAME) $(OBJ_DEMO)
			$(CC) $(CFLAGS) $(OBJ_DEMO) -lasm -L. -o $@ 

%.o:		%.c $(HEADER)
			$(CC) $(CFLAGS) -c $< -o $@

clean:
			rm -f $(OBJ) $(OBJ_DEMO)

fclean:		clean
			rm -f $(NAME) $(DEMO)

re:			fclean all

.PHONY:		all clean fclean re
