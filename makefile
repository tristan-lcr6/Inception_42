# Variables
NAME = inception
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml
DATA_PATH = /home/tlecuyer/srcs/requirements/
MARIADB_FOLDER = /home/tlecuyer/data/mariadb
WORDPRESS_FOLDER = /home/tlecuyer/data/wordpress


# Couleurs pour le terminal
GREEN = \033[0;32m
RED = \033[0;31m
COLOR_END = \033[0m

all: setup build up

setup:
	mkdir -p $(MARIADB_FOLDER)
	mkdir -p $(WORDPRESS_FOLDER)

build:
	@echo "$(GREEN)BUilding Images$(COLOR_END)"
	docker compose -f $(DOCKER_COMPOSE_FILE) build

up:
	@echo "$(GREEN)Starting containers$(COLOR_END)"
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@echo "$(RED)Stopping containers$(COLOR_END)"
	docker compose -f $(DOCKER_COMPOSE_FILE) down

stop:
	docker compose -f $(DOCKER_COMPOSE_FILE) stop

start:
	docker compose -f $(DOCKER_COMPOSE_FILE) start

clean: down
	@echo "$(RED)Suppression des images et réseaux...$(COLOR_END)"
	docker system prune -a -f

fclean: clean
	@echo "$(RED)Suppression totale (volumes inclus)...$(COLOR_END)"
	@sudo rm -rf $(DATA_PATH)
	@sudo rm -rf $(WORDPRESS_FOLDER)
	@sudo rm -rf $(MARIADB_FOLDER)
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true

re: fclean all

.PHONY: all build up down stop start clean fclean re