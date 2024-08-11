
# from https://hub.docker.com/_/debian
FROM debian:buster

# run commands in the container to install requirements
# vim, php, mariadb-server
# and change the owner of /var/www/html to www-data
RUN apt-get update -y \
&& apt-get install vim -y \
&& apt-get install php -y \
&& apt-get install mariadb-server -y \
&& chown -R www-data /var/www/html

# copy the configuration file for mariadb
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/script_mariadb.sh /

# create the directory for the pid file
RUN mkdir -p /run/mysqld

# change the owner of the directory for the pid file
RUN chown -R mysql:mysql /run/mysqld

# run the script to start the mariadb server
CMD ["sh", "/script_mariadb.sh"]
