FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get install curl php-fpm php-mysql mariadb-client

# Prepare necessary directories
RUN mkdir -p /run/php/
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy configuration and scripts
COPY ./tools/wp_init.sh /opt/wp_init.sh
COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Set permissions
RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["bash", "/opt/wp_install.sh"]
