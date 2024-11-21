mysql_install_db

service mariadb start;

mysql --verbose -u ${MARIADB_ROOT} -e "ALTER USER '${MARIADB_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

DB_EXISTS=$(mysql -u ${MARIADB_ROOT} -p${MYSQL_ROOT_PASSWORD} -e "SHOW DATABASES LIKE '${MYSQL_DATABASE}';" | grep ${MYSQL_DATABASE})

if [ -n "$DB_EXISTS" ]; then
	echo "Mariadb $MYSQL_DATABASE database already exists"
else
	mysql --verbose -u ${MARIADB_ROOT} -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE $MYSQL_DATABASE; FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD'; FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'; FLUSH PRIVILEGES;"
	mysql  --verbose -u ${MARIADB_ROOT} -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
fi

mysqladmin -u ${MARIADB_ROOT} --password=${MYSQL_ROOT_PASSWORD} shutdown

mysqld
