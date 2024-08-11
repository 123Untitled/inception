# nginx dockerfile

# from https://hub.docker.com/_/nginx
FROM debian:buster

# Install dependencies
# vim, nginx, openssl
RUN apt-get update -y \
&& apt-get install vim -y \
&& apt-get install nginx -y \
&& apt-get install openssl -y \
&& chown -R www-data /var/www/html \
&& rm -f /etc/nginx/sites-enabled/default \
&& mkdir -p /etc/nginx/ssl \
&& mkdir /conf

# Copy nginx config file
COPY conf/wordpress.conf /etc/nginx/conf.d/

# Copy openssl config file
COPY conf/openssl_form.conf /conf/

# Create a symbolic link to the nginx config file
RUN ln -s /etc/nginx/conf.d/wordpress.conf /etc/nginx/sites-enabled/

# Create a self-signed certificate for nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -config /conf/openssl_form.conf

# Expose port 443 for https connection
EXPOSE 443

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]



