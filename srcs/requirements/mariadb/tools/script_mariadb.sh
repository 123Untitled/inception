#!/bin/bash

# check if the database do not exist
if [ ! -e "/var/lib/mysql/$MYSQL_DATABASE" ]; then

	# start mysql server
	mysqld &

	# wait for mysql server to start (max 30 seconds)
	sleep 3

	# create database
	mysql -uroot -p$MYSQL_ROOT_PASS -e "CREATE DATABASE $MYSQL_DATABASE;"

	# create user
	mysql -uroot -p$MYSQL_ROOT_PASS -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASS' WITH GRANT OPTION;"

	# set root password
	mysql -uroot -p$MYSQL_ROOT_PASS -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASS');"

	# flush privileges
	mysql -uroot -p$MYSQL_ROOT_PASS -e "FLUSH PRIVILEGES;"

	echo "root password set"

	# stop mysql server
	mysqladmin -uroot -p$MYSQL_ROOT_PASS shutdown

else
	# else echo message
	echo Database already exist, creation step skipped
fi

# start mysql server
exec mysqld
