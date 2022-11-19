# === COLORS ====
BOLD		= \033[1m
RESET		= \033[0m

# === TARGETS ===
SRC			= --project-directory ./srcs

FLAGS		= --build

CONTAINERS	= $(shell docker ps -qa)

IMAGES		= $(shell docker image ls -q)

VOLUMES 	= $(shell docker volume ls -q)

NETWORKS	= $(shell docker network ls -q)

# === RULES =====
.PHONY: all
all:
	docker compose $(SRC) up $(FLAGS)

.PHONY: clean
clean:
	docker compose $(SRC) down

.PHONY: fclean
fclean: 
	docker stop $(CONTAINERS); \
	docker rm $(CONTAINERS); \
	docker image rm $(IMAGES); \
	docker network rm $(NETWORKS); \
	docker system prune -f;

##	USE WISELY !!
#	.PHONY: clear_volume
#	clear_volume: 
#		docker volume rm $(VOLUMES); \
#		sudo rm -rf /home/${USER}/data/wordpress/* 
#		sudo rm -rf /home/${USER}/data/mariadb
#		mkdir /home/${USER}/data/mariadb

.PHONY: ls
ls:
	@echo "\t----------------------------------"
	@echo "\t|        ${BOLD}CONTAINERS RUNNING${RESET}      |"
	@echo "\t----------------------------------"
	@docker ps
	@echo "\t----------------------------------"
	@echo "\t|             ${BOLD}IMAGES${RESET}             |"
	@echo "\t----------------------------------"
	@docker image ls
	@echo "\t----------------------------------"
	@echo "\t|            ${BOLD}NETWORKS${RESET}            |"
	@echo "\t----------------------------------"
	@docker network ls
	@echo "\t----------------------------------"
	@echo "\t|             ${BOLD}VOLUMES${RESET}            |"
	@echo "\t----------------------------------"
	@docker volume ls

.PHONY: re
re: fclean all
