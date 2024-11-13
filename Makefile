# Define variables
DOCKER_COMPOSE = docker-compose -f src/docker-compose.yml --env-file src/.env
PROJECT_NAME = inception

# Default target to build and start the project
.PHONY: all
all: up

# Build all services defined in docker-compose.yml
.PHONY: build
build:
	$(DOCKER_COMPOSE) build

# Start the containers in detached mode (background)
.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d

# Stop the containers without removing them
.PHONY: stop
stop:
	$(DOCKER_COMPOSE) stop

# Restart the services (rebuild and up)
.PHONY: restart
restart: stop build up

# Remove all containers and networks defined in docker-compose.yml
.PHONY: down
down:
	$(DOCKER_COMPOSE) down

# Clean up Docker system resources (containers, networks, volumes)
.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down -v --rmi all
	docker volume rm $(PROJECT_NAME)_data_base $(PROJECT_NAME)_wordpress_data || true

# Show logs from all containers
.PHONY: logs
logs:
	$(DOCKER_COMPOSE) logs -f

# Access a specific container's shell
.PHONY: shell
shell:
	docker exec -it $(PROJECT_NAME)_nginx /bin/bash
