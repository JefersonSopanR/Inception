FROM debian:bullseye


RUN apt-get update -y
RUN apt-get -y install curl php-fpm php-mysql mariadb-client

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/wordpress
# Wordpress installation

WORKDIR /var/www/


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN chown www-data: /var/www && chmod +x /var/www/wordpress

COPY ./tools/wp_init.sh /opt/wp_init.sh
COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["bash", "/opt/wp_init.sh"]
