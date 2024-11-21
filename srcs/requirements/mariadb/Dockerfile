FROM debian:bullseye

RUN apt-get update 
RUN apt-get install -y mariadb-server

EXPOSE 3306

RUN mkdir -p /run/mariadb
COPY ./tools/mariadb_init.sh /run/mariadb/mariadb_init.sh
COPY ./config/my.cnf /etc/mysql/mariadb.conf.d/myserver.cnf

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

RUN chmod +x /run/mariadb/mariadb_init.sh

ENTRYPOINT ["bash", "/run/mariadb/mariadb_init.sh"]
