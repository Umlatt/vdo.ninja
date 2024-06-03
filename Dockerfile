# Taking NGINX as base image
FROM nginx:stable

# Adding labels
LABEL "com.umlatt.description"="VDO Ninja"
LABEL "maintainer"="Richard <richard@lazylionconsulting.com>"

# Update packages and get certbot & nginx plugin for certbot
RUN apt update && apt upgrade -y
RUN apt-get install -y certbot python3-pip

# Create a directory for Python packages
RUN mkdir -p /usr/local/lib/certbot-nginx

# Install certbot-nginx using pip with the --target flag
RUN pip install --target=/usr/local/lib/certbot-nginx certbot-nginx

# Add PYTHONPATH environment variable to include the target directory
ENV PYTHONPATH=/usr/local/lib/certbot-nginx:$PYTHONPATH

# Get vdo.ninja webserver files
COPY ./vdo.ninja /var/www/html/vdo.ninja

# Add copy of default nginx conf file
COPY default.conf /etc/nginx/conf.d/.

# Add ssl worker files (for nginx https)
COPY ./init/ /init/

# Configure working directory
WORKDIR /var/www/html

# Set run on start commands
CMD "/init/entrypoint.sh"
