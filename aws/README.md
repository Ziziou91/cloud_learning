# EC2 instance Setup server guide
### Launching an EC2 instance from the EC2 dashboard
- new instance
- appropiate name
- ubuntu
- ssh key
- security rule
  - 22 for ssh -> allows us to config the server
  - 80 for http -> confirm nginx is running
  - 3000 for node server -> 



## Downloading the app onto the server

We have a couple of options for downloading the app on to our EC2 instance:

### Method 1: Transferring the files using SCP

We can use `SCP` to copy files between systems. It stands for Secure Copy Protocol. 

SCP uses encryption over an SSH (Secure Shell) connection. 

SCP commands have the following syntax:
```shell
    scp [OPTIONS] [[user@]src_host:]file1 [[user@]dest_host:]file2
```
**Examples**
Let's take a scenario where we have a file test.txt and we need to copy it to a remote server, our command will look like below:
```
    scp test.txt userbravo@destination:/location2

```
If we want to transfer a folder we need to use `-r`:
```
    scp example_folder userbravo@destination:/location2

```
Similar to logging into a cloud instance, we can pass an ssh key as our first argument. The syntax is as follows:
```
    scp -i ~/example_key.pem -r ~/folder ubuntu@destination:~
```
the above gives SCP 3 arguments:
1) The ssh key 
2) the folder to transfer
3) The destination


### Method 2: Cloning from a git respository 

We can also transfer files to our EC2 instance using git. 
```
 git clone repo-name
```

## Running our app
Our server uses Node.js, so we can use Node to run to. The app entry point is `app.js`
```
 node ~/sparta-test-app/app/app.js

```
Although this runs our server, it also occupies current bash windonw. If we want to run the node.js server in the background we have a couple of options available:

### nohup
Running a script in the background in linux can be done using nohup, using nohup we can run node application in the background.
```
    nohup node ~/sparta-test-app/app/app.js
```

### Forever
Forever is another solution for Node.js scripts.

First we need to install:
```
npm install forever -g
```

Then:
```
forever start /nodeapp/index.js
```