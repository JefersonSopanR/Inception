# Variables
DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = srcs/docker-compose.yml

# Default target
.PHONY: all
all: up

# Bring up the containers
.PHONY: up
up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d --build

# Stop the containers (but keep them for restarting later)
.PHONY: stop
stop:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

# Start the stopped containers (without rebuilding)
.PHONY: start
start:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) start

# Bring down the containers (remove containers, networks, etc.)
.PHONY: down
down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

# Show running containers
.PHONY: ps
ps:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) ps

# List all Docker volumes
.PHONY: volumes
volumes:
	docker volume ls

# Remove stopped containers and unused images/networks/volumes
.PHONY: clean
clean:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down --remove-orphans
	docker system prune -f
	docker volume prune -f

# Remove all containers, images, volumes, and networks
.PHONY: fclean
fclean:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans
	docker system prune -af
	docker volume prune -f

# Rebuild the containers
.PHONY: re
re: fclean up
