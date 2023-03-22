# Takeing NGINX as base image
FROM nginx
# Adding labels
LABEL "com.umlatt.description"="VDO Ninja"
LABEL "maintainer"="Richard <richard@noxnoctua.com>"
# Update packages and get certbot & nginx plugin for certbot
RUN apt update && apt upgrade -y
RUN apt-get install -y certbot python3-pip
RUN pip install certbot-nginx
# Get vdo.ninja webserver files
COPY ./vdo.ninja /var/www/html/vdo.ninja
# Add copy of default nginx conf file
COPY default.conf /etc/nginx/conf.d/.
# Add ssl worker files (for nginx https)
COPY ./init/ /init/
# Configure working directory
WORKDIR /var/www/html
# Set run on start commands
CMD /init/entrypoint.sh