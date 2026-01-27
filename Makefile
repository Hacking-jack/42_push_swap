# Configuration
NAME = push_swap.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a
PRINTF_DIR = printf
PRINTF = $(PRINTF_DIR)/libftprintf.a
# wildcard use just developing
SRCS = $(wildcard ft_*.c)

# File sources 
#SRCS = 

# Final object files
OBJS = $(SRCS:.c=.o)

AR = ar rcs
RM = rm -f

# Main rule for make
all: $(NAME)

# Library compilation
# you copy the compiled library libft.a to the printft
# and you combine and compile printft with libft 
#
# for the only one library requirement in norminette
$(NAME): $(OBJS)
		@echo "📦 Compiling $(LIBFT)"
		@make -C $(LIBFT_DIR)
		@cp $(LIBFT) $(PRINTF_DIR)
		@echo "$(LIBFT) compiled succesfuly"
		@make -C $(PRINTF_DIR)
		@echo "$(PRINTF) compiled succesfuly"
		@cp $(LIBFT) $(NAME)
		@cp $(PRINT) $(NAME)
		@$(AR) $(NAME) $(OBJS)
		@echo "✅ Library $(NAME) compiled"

# Compile .c to .o 
%.o:%.c
		@$(CC) $(CFLAGS) -c $< -o $@

# Clean .o 
clean:
		@$(RM) $(OBJS)
		@make -C $(LIBFT_DIR) clean
		@make -C $(PRINTF_DIR) clean
		@echo "Object removed"
# Clean everything
fclean: clean
		@$(RM) $(NAME)
		@make -C $(LIBFT_DIR) fclean
		@make -C $(PRINTF_DIR) fclean
		@echo "Library $(NAME) removed"

# Recompile
re : fclean all

.PHONY: all clean fclean re
