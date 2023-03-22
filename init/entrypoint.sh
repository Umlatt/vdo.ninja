#!/bin/bash
# Check & configure SSL
/init/ssl_init.sh
if pidof /usr/sbin/nginx > /dev/null; then
    echo "Nginx is running."
else
    echo "Nginx is starting..."
    /usr/sbin/nginx -g "daemon off;"
fi
echo "Nginx service killed. Container exiting"