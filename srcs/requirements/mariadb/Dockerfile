FROM debian:bullseye

# Install MariaDB server and client
RUN apt-get update && apt-get install -y \
    mariadb-server mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/installer.sh /usr/local/bin/

# Set permissions
RUN chmod +x /usr/local/bin/installer.sh

# Run the installer script
CMD ["installer.sh"]
