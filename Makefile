# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keitanig <keitanig@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/06 21:30:33 by keitanig          #+#    #+#              #
#    Updated: 2022/03/01 20:24:31 by keitanig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libftprintf.a

LIBFT	= libft/libft.a

SRCS	= ft_printf.c print_c.c print_di.c print_p.c \
	print_s.c print_u.c print_x.c \
	parse.c

OBJS	= $(SRCS:.c=.o)

CC		= cc
CFLAGS	= -Wall -Wextra -Werror
RM		= rm -f

all: $(NAME)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $^

$(NAME): $(OBJS)
	make all -C ./libft
	cp $(LIBFT) $(NAME)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)
	make clean -C ./libft

fclean: clean
	$(RM) $(NAME)
	make fclean -C ./libft

re: fclean all

.PHONY: all clean fclean re
