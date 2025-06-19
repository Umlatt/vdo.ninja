#!/bin/bash

# Check & configure SSL only if SSL is not explicitly set to "off"
if [[ "${SSL,,}" != "off" ]]; then
    echo "Auto SSL required. Running ssl_init..."
    /init/ssl_init.sh
else
    echo "Auto SSL not required. Skipping ssl_init..."
fi

# Start or check nginx
if pidof /usr/sbin/nginx > /dev/null; then
    echo "Nginx is running."
else
    echo "Nginx is starting..."
    /usr/sbin/nginx -g "daemon off;"
fi

echo "Nginx service killed. Container exiting"

