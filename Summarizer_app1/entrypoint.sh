#!/bin/sh
set -e

# Replace placeholders in config.template.js with actual env variables
envsubst '${VITE_APP_URL}' < /usr/share/nginx/html/config.template.js > /usr/share/nginx/html/config.js

# Optional: show what got injected
echo "Generated runtime config:"
cat /usr/share/nginx/html/config.js

# Start nginx
exec nginx -g 'daemon off;'
