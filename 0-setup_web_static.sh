#!/usr/bin/env bash
# First configure for servers using bash

sudo apt update
sudo apt install -y nginx
sudo mkdir -p /data/web_static/releases/test
sudo mkdir -p /data/web_static/shared
sudo touch /data/web_static/releases/test/index.html
sudo chmod 666 /data/web_static/releases/test/index.html
echo -e "<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data
sudo sed -i '/listen 80 default_server;/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-available/default
sudo service nginx restart
