
# main commands
all:
	mkdir -p /root/data/site
	mkdir -p /root/data/database
	chmod 777 /root/data/site
	chmod 777 /root/data/database
	docker-compose -f ./srcs/docker-compose.yml up -d --build

# build the project
build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

# stop the project
stop:
	docker-compose -f ./srcs/docker-compose.yml stop

# start the project
start:
	docker-compose -f ./srcs/docker-compose.yml start

# restart the project
down:
	docker-compose -f ./srcs/docker-compose.yml down

# clean the project
clean: down
	docker volume rm srcs_mariadb_volume
	docker volume rm srcs_wordpress_volume
	docker system prune -af
	docker volume prune -f

# clean the project and delete all data
fclean : clean
	rm -rf /root/data/site
	rm -rf /root/data/database

# clean and build the project
re: fclean all

# show the logs
log :
	docker-compose -f srcs/docker-compose.yml logs
