#!/bin/bash

# update 
echo updating...
sudo apt update -y
echo done!
 
# upgrade
echo upgrade packages...
# Fix this command! Asks for user inputs
# "pending kernel upgrade"
# sudo apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo done! 

# install nginx
echo installing nginx...
# Fix this command! Asks for user inputs
# "pending kernel upgrade"
# sudo apt install nginx -y
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo done!

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
sudo npm -E install

sudo npm install -g pm2 

# stop any previously running versions of the app
sudo pm2 stop app.js
# run app
pm2 start node app.js 