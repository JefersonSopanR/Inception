FROM debian:buster

EXPOSE 9000

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y php7.3-fpm php7.3-mysql mariadb-client curl

# Configure PHP-FPM for WordPress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Step to download and extract WordPress
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

# Ensure /var/www/html directory exists and extract WordPress properly
RUN mkdir -p /var/www/html && \
    tar -xzf /var/www/latest.tar.gz -C /var/www && \
    rm -rf /var/www/latest.tar.gz && \
    mv /var/www/wordpress /var/www/html/wordpress


# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp

# Create PHP run directory
RUN mkdir /run/php

# Copy WordPress installation script
COPY ./tools/wp_install.sh /var/www/html/wordpress/wp_install.sh
RUN chmod +x /var/www/html/wordpress/wp_install.sh

# Run the WordPress installation script
CMD ["bash", "/var/www/html/wordpress/wp_install.sh"]
