# Takeing NGINX as base image
FROM nginx
# Adding labels
LABEL "com.umlatt.description"="VDO Ninja"
LABEL "maintainer"="Richard <richard@noxnoctua.com>"
# Getting latest packages
RUN apt update && apt upgrade -y
RUN apt-get install -y certbot python3-pip
RUN pip install certbot-nginx

# Get vdo.ninja files
COPY ./vdo.ninja /var/www/html/vdo.ninja
# Get new NGINX conf
COPY default.conf /etc/nginx/conf.d/.
# Set working dir
WORKDIR /var/www/html
# Expose required ports
EXPOSE 80
EXPOSE 443
# Set run on start commands
ENTRYPOINT sed -i "s|<SERVER_URL>|${SERVER_URL}|g" /etc/nginx/conf.d/default.conf && certbot --nginx --non-interactive --agree-tos -m $EMAIL_ADDRESS -d $SERVER_URL && nginx -s reload && /bin/bash