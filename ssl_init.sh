#!/bin/bash
echo "Init SSL..."
if [ -f "ssl_create.sh" ]
then
    echo "No cert currently exists, generaing SSL. Please wait..."
    ./ssl_create.sh
    if [ $? -eq 0 ]; then
        echo "SSL cert created successfully."
        mv ssl_create.sh ssl_create.sh.done
    else
        echo "SSL cert failed to create. Please resolve error in log and then restart container."
    fi
else
    certbot -q renew --nginx
    if [ $? -eq 0 ]; then
        echo "SSL cert renewed successfully."
    else
        echo "ERROR: SSL cert could NOT be renewed. Please resolve error in logs and then restart the container."
    fi
fi