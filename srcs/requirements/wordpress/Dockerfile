
# from https://hub.docker.com/_/wordpress
FROM debian:buster

# run commands in the container to install requirements
# curl, vim, php, php7.3-mysql, php7.3-fpm, php7.3-gd, mariadb-client
# and change the owner of /var/www/html to www-data
RUN apt-get update -y \
&& apt-get install curl -y \
&& apt-get install vim -y \
&& apt-get install php -y \
&& apt-get install php7.3-mysql -y \
&& apt-get install php7.3-fpm -y \
&& apt-get install php7.3-gd -y \
&& apt-get install mariadb-client -y \
&& chown -R www-data /var/www/html \
&& mkdir -p /var/run/php \
&& mkdir -p /root/utils

# install wp-cli to manage wordpress from the command line
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

# copy the configuration files for wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# copy the script to start the wordpress server
COPY ./tools/script_wordpress.sh /root/utils/

# run the script to start the wordpress server
CMD ["sh", "/root/utils/script_wordpress.sh"]
