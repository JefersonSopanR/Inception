#!/bin/bash

# Check for required environment variables
if [[ -z "$MYSQL_DATABASE" || -z "$MYSQL_USER" || -z "$MYSQL_PASSWORD" ]]; then
  echo "Environment variables MYSQL_DATABASE, MYSQL_USER, and MYSQL_PASSWORD must be set."
  exit 1
fi

# Create the init file for database setup
cat <<EOF > /etc/mysql/init.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Ensure the mysqld runtime directory exists
mkdir -p /run/mysqld

# Start the MariaDB server
exec mysqld
