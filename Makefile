NAME = so_long
CC = gcc
CFLAGS = -Wall -Werror -Wextra
MLX_FLAGS = -lmlx -lXext -lX11
LIB_PATH = /libft
LIBFT = libft/libft.a
INCLUDE = includes/so_long.h
SRCS = 
OBJS = $(SRCS:src/%.c=obj/%.o)

all:	$(NAME)

$(NAME):	$(OBJS) libft/libft.a
				$(CC) $(CFLAGS) $^ $(MLX_FLAGS) -o $(NAME)

libft/libft.a:
				make -C $(LIB_PATH)

obj/%.o:	src/%.c $(INCLUDE)
				mkdir -p obj
				$(CC) $(CFLAGS) -I include -c $< -o $@

clean:			make clean -C $(LIB_PATH)
				rm -rf obj

fclean:			clean
					make fclean -C $(LIB_PATH)
					rm -rf so_long

re:				fclean all

.PHONY:			all clean fclean re