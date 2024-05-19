#!/bin/bash

# Define the path to the nginx default configuration file
NGINX_DEFAULT_CONFIG="/etc/nginx/sites-available/default"

# Define the new locations to add to the default configuration
NEW_LOCATIONS=$(cat <<EOF
server {
    location /janus {
        proxy_pass http://127.0.0.1:8088/janus;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
    }

    location /websocket {
        proxy_pass http://127.0.0.1:8188;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
    }

    location /docs {
        alias /opt/janus/share/janus/html;
        index index.html;
    }
}
EOF
)

# Append the new locations to the default configuration
echo "$NEW_LOCATIONS" | sudo tee -a "$NGINX_DEFAULT_CONFIG" > /dev/null

# Restart nginx to apply the changes
sudo systemctl restart nginx
