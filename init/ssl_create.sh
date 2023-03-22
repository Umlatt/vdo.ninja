#!/bin/bash
# Update servername in nginx config file
sed -i "s|<SERVER_URL>|${SERVER_URL}|g" /etc/nginx/conf.d/default.conf
# Create a certificate for the server
certbot --nginx --non-interactive --agree-tos -m $EMAIL_ADDRESS -d $SERVER_URL