#!/bin/bash

# NOTE set DB_HOST environment variable for database BEFORE running this script
# export DB_HOST=.....

# update 
echo updating...
sudo apt update -y
echo DONE update
 
# upgrade
echo upgrading packages...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo DONE upgrade 

# install nginx
echo installing nginx...
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo DONE finished installing nginx!

# Set reverse proxy in nginx config
echo setting reverse proxy in nginx/sites-enabled/default
sudo sed -i '51s/.*/\t        proxy_pass http:\/\/localhost:3000;/' /etc/nginx/sites-enabled/default
echo DONE reverse proxy set

# restart nginx
echo restarting nginx...
sudo systemctl restart nginx
echo DONE nginx restarted

# enable nginx
echo enabling nginx...
sudo systemctl enable nginx
echo DONE nginx enabled

# install nodejs v20
echo installing node v20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo DEBIAN_FRONTEND=noninteractive -E bash - && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo DONE node v20.x installed

# clone app from github
echo cloning app from github
git clone https://github.com/Ziziou91/sparta-test-app.git
# git clone https://github.com/Ziziou91/sparta-test-app.git repo 
echo DONE app cloned from github


# cd app folder
# cd ~/repo/app
cd ~/sparta-test-app/app

# npm install
sudo -E npm install

sudo npm install -g pm2 -y
echo DONE npm packages installed
# stop any previously running versions of the app
pm2 stop app
echo DONE previous verions of app stopped on pm2
# run app
pm2 start app.js 
echo DONE started app with pm2

echo =====server_setup.sh has finished===== 
