# Takeing NGINX as base image
FROM nginx
# Adding labels
LABEL "com.umlatt.description"="VDO Ninja"
LABEL "maintainer"="Richard <richard@noxnoctua.com>"
# Getting latest packages
RUN apt update && apt upgrade -y
# Get vdo.ninja files
COPY ./vdo.ninja /var/www/html/.
# Get new NGINX conf
COPY default.conf etc/nginx/conf.d/.
# Set working dir
WORKDIR /var/www/html