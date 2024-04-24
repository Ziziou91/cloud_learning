#!/bin/bash

# update 
echo updating...
sudo apt update -y
echo done!
 
# upgrade
echo upgrading packages...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo done! 

# install nginx
echo installing nginx...
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo finished installing nginx!

# Set reverse proxy in nginx config
sudo sed -i '51s/.*/\t        proxy_pass http:\/\/localhost:3000;/' /etc/nginx/sites-enabled/default


# restart nginx
echo restarting nginx...
sudo systemctl restart nginx
echo done!

# enable nginx
echo enabling nginx...
sudo systemctl enable nginx
echo done!

# install node
echo installing node v20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo DEBIAN_FRONTEND=noninteractive -E bash - && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo node -v

# clone app from github
git clone https://github.com/Ziziou91/sparta-test-app.git

# cd app folder
cd ~/sparta-test-app/app

# npm install
sudo -E npm install

sudo npm install -g pm2 -y

# stop any previously running versions of the app
pm2 stop app
# run app
pm2 start app.js 