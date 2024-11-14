all: 
	@sudo sh -c "echo '127.0.0.1 jesopan-.42.fr' >> /etc/hosts" && echo "successfully added jesopan-.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo sed -i '/127.0.0.1 jesopan-.42.fr/d' /etc/hosts && echo "successfully removed jesopan-.42.fr from /etc/hosts"
	@if [ -d "/home/jesopan-/data/wordpress_data" ]; then \
		sudo rm -rf /home/jesopan-/data/wordpress_data/* && \
		echo "successfully removed all contents from /home/jesopan-/data/wordpress_data"; \
	fi;

	@if [ -d "/home/jesopan-/data/data_base" ]; then \
		sudo rm -rf /home/jesopan-/data/data_base/* && \
		echo "successfully removed all contents from /home/jesopan-/data/data_base"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all clean fclean re ls
