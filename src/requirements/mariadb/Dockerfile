FROM debian:buster

# Expose MariaDB port
EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD={DB_ROOT_PASSWORD}

# Install MariaDB in a single RUN statement for caching and size optimization
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy custom MariaDB configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy initialization script
COPY tools/mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh

# Set command to run the MariaDB entrypoint script
CMD ["/mariadb.sh"]
