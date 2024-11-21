
DOCKER_COMPOSE = srcs/docker-compose.yml

all: up

up:
	@echo "Docker compose up [$(DOCKER_COMPOSE)]"
	@docker-compose -f $(DOCKER_COMPOSE) up -d
	
down-all:
	@echo "Docker compose down and removes everything [$(DOCKER_COMPOSE)]"
	@docker-compose -f $(DOCKER_COMPOSE) down -v --remove-orphans --rmi all
down:
	@echo "Docker compose down and removes everything [$(DOCKER_COMPOSE)]"
	@docker-compose -f $(DOCKER_COMPOSE) down -v

re-img:
	@docker-compose -f $(DOCKER_COMPOSE) up -d --build

clean-cache:
	@echo "Cleaning Docker cache"
	@docker system prune -a

re : down up


.PHONY: all up down down-all re-img clean-cache
