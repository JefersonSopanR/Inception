FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y php7.3-fpm php7.3-mysql \
	mariadb-client curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN tar -xvf /var/www/latest.tar.gz -C /var/www/ \
	&& rm -rf /var/www/latest.tar.gz

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/bin/wp

RUN mkdir /run/php

COPY ./conf/wp_install.sh /var/www/wordpress/wp_install.sh
RUN chmod +x /var/www/wordpress/wp_install.sh

CMD ["bash", "/var/www/wordpress/wp_install.sh"]