FROM debian:bullseye

# Install PHP and necessary modules
RUN apt-get update && apt-get install -y \
    php php7.4-fpm php-mysqli wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy configuration and setup files
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/installer.sh /usr/local/bin/

# Set script permissions
RUN chmod +x /usr/local/bin/installer.sh

# Run the installer script
CMD ["installer.sh"]
