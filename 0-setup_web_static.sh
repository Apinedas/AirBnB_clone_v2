#!/usr/bin/env bash
# First configure for servers using bash

sudo apt update
sudo apt install -y nginx
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
sudo touch /data/web_static/releases/test/index.html
sudo chmod 666 /data/web_static/releases/test/index.html
echo -e "<html>\n\t<head>\n\t</head>\n\t<body>\n\t\tHolberton School\n\t</body>\n</html>" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data/
new_string="server_name _;\n\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}"
sudo sed -i "0,/server_name _;/{s|server_name _;|$new_string|}" /etc/nginx/sites-available/default
sudo service nginx restart
