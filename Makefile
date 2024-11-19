all:
	@mkdir -p /home/jesopan-/data/wordpress
	@mkdir -p /home/jesopan-/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: down all

.PHONY: all down re
