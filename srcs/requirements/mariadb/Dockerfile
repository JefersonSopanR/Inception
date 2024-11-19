FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Expose MariaDB port
EXPOSE 3306

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 755 /var/run/mysqld

# Copy configuration and initialization script
COPY ./tools/mariadb_init.sh /run/mariadb/mariadb_init.sh
COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Make initialization script executable
RUN chmod +x /run/mariadb/mariadb_init.sh

# Set the entrypoint to the initialization script
ENTRYPOINT ["bash", "/run/mariadb/mariadb_init.sh"]
