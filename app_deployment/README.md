# App Deployment

This readme described how to deploy a 2-tier web sever and database application on AWS using EC2 instances. 

The EC2 instance hosting the web server uses nginx, and the EC2 instance hosting the database uses Mongodb.

# Setting up the web server
## Launching the EC2 instance
- new instance
- appropiate name
- ubuntu
- ssh key
- security rule
  - 22 for ssh -> allows us to config the server
  - 80 for http -> confirm nginx is running
  - 3000 for node server -> 

connect to instance with ssh

# Setting up the database
## Launching the EC2 instance
- new instance
- appropiate name
- ubuntu
- ssh key
- security rule
  - 22 for ssh
  - 27017 for mongodb
- 

## Configuring and starting the Mongodb database
- Run sh script
  - looks for updates, installs where appropiate
  - installs Mongodb. Version 7.0.6 -> Holds so this won't change without user intervention. Ensures compatibility
  Bind ip address in the monogod config file to allow incoming connections
- Start mongodb
- Enabling mongod. Ensures mongodb automatically starts whenever out instance starts up 

# Starting the web server
## Configuration
- set the environment variable -> Explain where we can find the IP address, as well as why we can use private



## Starting the server
run shell file.
  - looks for updates, installs where appropiate
  - install nginx
  - enable nginx.
  - install node
  - clone app code from github
  - change directory into app
  - install dependecies with npm
  - install pm2 -> allows us to run the node app in the background. Freeing up the bash window. 
  - stops any previously running instances of app.js 
  - run the app

# Using the web server
Show it working.
