#!/bin/bash
# Configure SSL
/init/ssl_init.sh
# Check if nginx service is running, and start if not
echo "Validating Nginx"
if service nginx status | grep -q "running" ; then
    echo "Nginx service is running"
else
    echo "Nginx service is not running. Starting..."
    service nginx start
fi
# Wait for nginx service to be killed
while service nginx status | grep -q "running" ; do
    sleep 5
done
echo "Nginx service killed. Container exiting"
