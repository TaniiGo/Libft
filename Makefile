# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keitanig <keitanig@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/11 18:35:55 by keigo             #+#    #+#              #
#    Updated: 2022/06/12 16:40:47 by keitanig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBFT_SRCS = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c \
		ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
		ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c \
		ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c \
		ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c \
		ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
		ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c \
		ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c \
		ft_tolower.c ft_toupper.c \
		ft_straddc.c ft_straddc_first.c \
		ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c \
		ft_lstdelone.c ft_lstiter.c ft_lstlast.c \
		ft_lstmap.c ft_lstnew.c ft_lstsize.c
	
PRF_SRCS = ft_printf.c parse.c print_c.c print_di.c print_p.c \
		print_s.c print_u.c print_x.c
		
GNL_SRCS = get_next_line.c

LIBFT_DIR = srcs/libft/
PRF_DIR = srcs/printf/
GNL_DIR = srcs/get_next_line/

ALL_SRCS = $(addprefix $(LIBFT_DIR), $(LIBFT_SRCS)) \
		$(addprefix $(PRF_DIR), $(PRF_SRCS)) \
		$(addprefix $(GNL_DIR), $(GNL_SRCS))

OBJS		=	$(ALL_SRCS:.c=.o)

INCS		=	-I./include

NAME		=	libft.a

CC			=	cc
RM			=	rm -f
CFLAGS		=	-Wall -Wextra -Werror

all: $(NAME)

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCS) -o $@ $^

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

# bonus:
# 	@make WITH_BONUS=1

re: fclean all

.PHONY: all clean fclean re
