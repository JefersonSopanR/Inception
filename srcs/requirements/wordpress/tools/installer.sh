#!/bin/bash

# Exit on error
set -e

# Download and install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Set ownership and permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Change to the web root and execute WordPress setup as www-data
sudo -u www-data bash <<EOF
wp core download
wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST
wp core install --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD
EOF

# Start PHP-FPM in the foreground
exec php-fpm7.4 -F
