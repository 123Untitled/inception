#!/bin/bash

# check if wordpress not already installed
if [ ! -e "/var/www/html/wp-config.php" ]; then

	# wait for mysql to be up
	sleep 10

	# create database if not exist and grant privileges
	wp core download --path=/var/www/html --allow-root

	# create wp-config.php file with right credentials
	wp config create --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASS --dbhost=$MYSQL_HOST --allow-root

	# install wordpress with admin user and password
	wp core install --path=/var/www/html --url="artblin.42.fr" --title="nofx" --admin_user=$MYSQL_ADMIN_USER --admin_password=$MYSQL_ADMIN_USER_PASS --admin_email=elon.musk@yahoo.fr --allow-root

	# create a new user with editor role and passwor
	wp user create --path=/var/www/html tobi tobi@exemple.com --user_pass=pass --role=editor --allow-root

else
	sleep 3
	# else echo message
	echo Wordpress already installed, installation step skipped
fi

# start php-fpm service in foreground
exec php-fpm7.3 -F -R --nodaemonize
