FROM debian:bullseye

# php-fpm --> Handles PHP requests.
# php-mysql --> Enables PHP to connect to MariaDB.
# mariadb-client --> Allows this container to communicate with the MariaDB database.
RUN apt-get update -y
RUN apt-get -y install curl php-fpm php-mysql mariadb-client

# Creating the directory /run/php/ to store the PHP process ID file.
RUN mkdir -p /run/php/
# Creating the directory /var/www/wordpress to store the WordPress files.
RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/

# WP-CLI is a command-line interface for managing WordPress installations
# By moving the file to /usr/local/bin/wp, it can be executed from anywhere in the container using the command wp.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# opt --> Contains optional software and packages.
# /opt/wp_init.sh --> Automates WordPress setup during startup.
COPY ./tools/wp_init.sh /opt/wp_init.sh
COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["bash", "/opt/wp_init.sh"]
