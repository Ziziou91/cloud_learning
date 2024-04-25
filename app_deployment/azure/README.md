# 2 tier app deployment on Azure

This readme describes how to deploy a 2-tier web server and database application on Azure using virtual machine instances and a virtual network. 

The virtual machine instance hosting the web server uses nginx and Node.js. The virtual machine instance hosting the database uses Mongodb.

Much of the instance setup has been automated with bash scripts. Copies of these scripts can be found in the parent folder.

## Instructions
NOTE: if you don't already have a suitable SSH public key on your virtual network please set one up before continuing.

## Launching a virtual network 
Azure gives us the option of creating a virtual network to let our virtual machines securely communicate with each other. We're going to start by creating a virtual network.

1) Open the resource group the SSH key and virtual network are stored and create a new virtual machine.
2) Choose an appropiate name for the virtual network and make sure it's being deployed in the same region we're going to deploy our virtual machines in.
3) Address space: if it isn't already populated the fields with it then add 10.0.0.0/16
4) Just below this create our two subnets:
   1)  public-subnet, Address range: 10.0.2.0/24
   2)  private-subnet, Address range: 10.0.3.0/24
5) Review and create

## A note on the virtual machine instance setup
This README will only specify the settings we require when launching our virtual machine instances.

For a more comprehensive look at virtual machines on Azure and the set up process, as well as why we're using these settings, a more detailed markdown file exploring process of creating a new virtual machine instance using the Azure GUI can be found TBC

## Setting up the database
Note: unlike later steps in this guide, the order which we launch the virtual machines is not important. If you need to terminate an instance and launch a new one these steps will still be applicable.

### Launching the virtual machine
1) Open the resource group the SSH key and virtual network are stored and create a new virtual machine.
2) Choose an  appropiate name for the new instance - something descriptive and easy to find in the instance management dashboard. For example:
```
tech258-joshg-first-deploy-db 
```
1) Suitable name
2) Same region as the virtual network
3) Image 22.04 Pro - Gen 2
4) Size B1S
5) Username 
6) SSH key
7) Disk. Change to standard SSD
8) Networking. Choose VN we created a moment ago.
     - port 22 open for ssh. This will allow us to config the server
     - NOTE: unlike AWS We DO NOT need port 27017 open for mongodb. This is handled by the virtual network we created earlier.
9)  Review Launch the instance

## Setting up the web server
Note: unlike later steps in this guide, the order which we launch the virtual machines is not important. If you need to terminate an instance and launch a new one these steps will still be applicable.

### Launching the virtual machine
1) Open the resource group the SSH key and virtual network are stored and create a new virtual machine.
2) Choose an  appropiate name for the new instance - something descriptive and easy to find in the instance management dashboard. For example:
```
tech258-joshg-first-deploy-db 
```
1) Suitable name
2) Same region as the virtual network
3) Image 22.04 Pro - Gen 2
4) Size B1S
5) Username 
6) SSH key
7) Disk. Change to standard SSD
8) Networking. Choose VN we created a moment ago.
     - port 22 open for ssh. This will allow us to config the server
     - port 80 open for http.
9)  Review Launch the instance