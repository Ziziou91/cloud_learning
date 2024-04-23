# App Deployment

This readme describes how to deploy a 2-tier web server and database application on AWS using EC2 instances. 

The EC2 instance hosting the web server uses nginx and Node.js. The EC2 instance hosting the database uses Mongodb.

Much of the instance setup has been automated with bash scripts. Copies of these scripts can be found in this folder.

## A note on EC2 instance setup
This README will only specify the settings required when launching both EC2 instances.

For a more comprehensive look at setting up EC2 instances, as well as why we're using these settings, a more detailed markdown file exploring the process of creating a new EC2 instance using the AWS GUI can be found [here](../README.md)

## Setting up the web server
Note: unlike later steps in this guide, the order which we launch the EC2 instances is not important. If you need to terminate an instance and launch a new one these steps will still be applicable.

### Launching the EC2 instance
1) Open the EC2 dashboard and launch a new instance
2) Choose an  appropiate name for the new instance - something descriptive and easy to find in the instance management dashboard. For example:
  ```
  tech258-joshg-first-deploy-app 
  ```
3) Choose Ubuntu as the Amazon Machine Image (AMI)
4) Choose a suitable ssh key pair
5) Under network settings we want to add the following rules:
     - port 22 open for ssh. This will allow us to config the server
     - port 80 open http. Allows us to connect to nginx in browser
     - port 3000 open for node server. We'll be using this port to serve data from the database.
6) Keep the storage at 8gb
7) Launch the instance

### Connecting to the EC2 instance
Once the EC2 instance is live we can connect to it using SSH. Click on the instance, press connect, and then copy the instructions under the SSH tab.

## Setting up the database
### Launching the EC2 instance
1) Open the EC2 dashboard and launch a new instance
2) Choose an  appropiate name for the new instance - something descriptive and easy to find in the instance management dashboard. For example:
```
tech258-joshg-first-deploy-db 
```
3) Choose Ubuntu as the Amazon Machine Image (AMI)
4) Choose a suitable ssh key pair
5) Under network settings we want to add the following rules:
     - port 22 open for ssh. This will allow us to config the server
     - port 27017 open for mongodb. Allows the server to connect to the mongodb Database.
6) Keep the storage at 8gb
7) Launch the instance

### Configuring and starting the Mongodb database
The Mongodb database needs to be running and ready to receive incoming network connections before we can configure the server. This is because the script to seed the database is included in the server app. 

We'll be running the database seeding script in the server setup shell file, so we need to need to configure the database first.

**Instructions**

If starting the EC2 instance for the first time you need to grant permission to execute the script:
```shell
  chmod +x mongodb_setup.sh
```

Run the `mongodb_setup.sh` script:
```shell
  ./mongodb_setup.sh
```
This script does the following:
1) looks for updates, installs where appropiate
2) Installs Mongodb version 7.0.6.
3) Holds the Mongodb version so this won't be changed during future upgrades without user intervention. This is to ensure ongoing compatibility
4) Bind ip address in the monogod config file to allow incoming connections
5) Start mongodb
6) Enable mongod so to automatically starts when our instance starts up 

## Starting the web server
### Configuration
Now that our EC2 instance hosting the database is live we have the information we need to point the server to it. 

In order to do this we provide the server with an environment variable that includes the ip address for the database server
```shell
export DB_HOST=mongodb://{database_private_ip}:27017/posts
```
where `{database_private_ip}` is the private ip address that the database can be found at.

Note that we are able to use the private ip address for this as both EC instances are on the same AWS cluster. 

## Starting the server

If starting the EC2 instance for the first time you need to grant permission to execute the script:
```
chmod +x server_setup.sh
```
Run the `server_setup.sh` script:
```shell
  ./server_setup.sh
```
This script does the following:
  1) looks for updates, installs where appropiate
  2) Installs nginx
  3) Enables nginx
  4) Installs node
  5) Clones the app code from github
  6) Changes directory into the app folder
  7) install dependecies with npm
  8) install pm2 -> allows us to run the node app in the background.Freeing up the bash window. 
  9) stops any previously running instances of the app 
  10) runs the app with pm2

## Using the web server
We can access the web server using `http`. 

Type in the ip address and port 3000 into a browser window.

We can 