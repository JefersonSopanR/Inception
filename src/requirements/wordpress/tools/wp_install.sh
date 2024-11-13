cd /var/www/worpress

wp core config	--dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb:3306 --allow-root

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD \
				--admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=AUTHOR --user_pass=$WP_USER_PWD --allow-root

cd -

php-fpm7.3 -F