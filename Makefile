NAME 		:= #NAME OF PROJECT/EXECUTABLE

CPP 		:= c++
CPPFLAGS	:= -Wall -Wextra -Werror -std=c++98 -MMD

SRC_DIR		:=	./
OBJ_DIR		:=	.obj/
DEP_DIR		:=	.dep/
INC_DIR		:=	includes/

SRC_FILES	:= main.cpp #ADD FILES INSIDE SOURCES DIRECTORY

OBJ_FILES	:=	$(SRC_FILES:.cpp=.o)
DEP_FILES	:=	$(OBJ_FILES:.o=.d)

SRC			:=	$(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ			:=	$(addprefix $(OBJ_DIR), $(OBJ_FILES))
DEP			:=	$(addprefix $(DEP_DIR), $(DEP_FILES))

all: $(NAME)

$(NAME): $(OBJ)
		@echo CREATING #WHAT YOU WANT#
		@$(CPP) $(CPPFLAGS) -o $(NAME) $(OBJ)
		@sleep 1
		@tput cuu1 dl1
		@echo "#WHAT YOU WANT# CREATED  " 


$(OBJ_DIR)%.o:$(SRC_DIR)%.cpp
	@mkdir -p $(OBJ_DIR) $(DEP_DIR)
	@$(CPP) $(CPPFLAGS) -I $(INC_DIR) -o $@ -c $<
	@mv $(OBJ_DIR)$*.d $(DEP_DIR)

-include $(DEP)

clean:
	@$(RM) -fr $(OBJ_DIR) $(DEP_DIR)
	@echo #WHAT YOU WANT# DESTROYED BYE !
	@sleep 1
	@tput cuu1 dl1

fclean: clean
	@$(RM) $(NAME)
	@echo #WHAT YOU WANT# DESTROYED BYE !
	@sleep 1
	@tput cuu1 dl1

re: fclean all

.PHONY : all clean fclean re
