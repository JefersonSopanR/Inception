# Path to your docker-compose.yml file
DOCKER_COMPOSE = srcs/docker-compose.yml

# Default target to start everything
all: up

# Bring up the containers in detached mode
up:
	@echo "Starting containers using [$(DOCKER_COMPOSE)]"
	docker-compose -f $(DOCKER_COMPOSE) up -d

# Bring everything down, remove volumes and orphans, but leave images intact
down:
	@echo "Stopping containers and removing volumes [$(DOCKER_COMPOSE)]"
	docker-compose -f $(DOCKER_COMPOSE) down -v

# Completely remove containers, images, volumes, and orphans
down-all:
	@echo "Stopping and cleaning everything [$(DOCKER_COMPOSE)]"
	docker-compose -f $(DOCKER_COMPOSE) down -v --remove-orphans --rmi all

# Rebuild images and restart containers
re-img:
	@echo "Rebuilding images and restarting containers [$(DOCKER_COMPOSE)]"
	docker-compose -f $(DOCKER_COMPOSE) up -d --build

# Clean up unused Docker resources
clean-cache:
	@echo "Cleaning Docker cache"
	docker system prune -a -f

# Shortcut to restart containers without rebuilding images
re:
	@echo "Restarting containers without rebuilding images"
	make down
	make up

# Mark targets as not corresponding to actual files
.PHONY: all up down down-all re-img clean-cache re
