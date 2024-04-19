# Linux
Linux is an open-source operating system kernel. It is built on the Unix operating system principles, offering users a versatile and customizable platform. Popoular Linux distributions, such as Ubuntu, Debian, and CentOS, package the Linux kernel with additional software and tools to provide more functionality.

Linux has become immensely popular in DevOps due to several key reasons: 
1) Its open-source nature encourages collaboration and innovation, fostering the development of tools and utilities tailored for automation, orchestration, and continuous integration/continuous deployment (CI/CD) pipelines. 
2) Linux's lightweight nature allows it to efficiently run on both traditional hardware and cloud-based infrastructure, enabling seamless deployment and scaling of applications. 
3) Linux's robust security features, such as granular user permissions and robust access control mechanisms, enhance the overall security posture of DevOps environments. 
4) Linux's extensive support for scripting languages and containerization technologies like Docker and Kubernetes simplifies the development and deployment of complex distributed systems, making it an ideal choice for DevOps practitioners aiming for agility and scalability in their workflows.

## Linux commands
### Bash
Bash is a command-line interpreter or shell for Unix-like operating systems. It provides users with a text-based interface to interact with their operating system, executing commands, running scripts, and managing files and directories. 

Its robust command-line editing capabilities, history management, and job control features make it a favorite among system administrators, programmers, and power users for automating tasks and managing system configurations efficiently.

Below is a collection of popular Linux commands, organised by purpose, along with examples of their usage where appropiate.

### Files and Directories

| Command | Description                                                     |
| ----  | ----------------------------------------------------------------- |
| cd    | changes directory. We can pass a path as an argument (e.g. /home/)|
| cd .. | Move up one directory in the file tree                            |
| mv filename newname | Moves a file to the location at newname. Also useful for renaming a file
| cp SOURCE DEST  | Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.
| mkdir  DIRECTORY  | Create the DIRECTORY(ies), if they do not already exist.   |
| ls        | List information about the FILEs (the current directory by default). Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.
| ll          | Long list. Provides more details by default, including permissions.
| pwd         | pathwise directory
|  rm  | removes a file or directory. Use -r flag (recursive) for directories. |
| cat  | print out contents of a file                                          |


## Flag
| Flag | Description                                                     |
| ----  | ----------------------------------------------------------------- |
|  --help  | prints instructions of command usage, other flags, description and examples
| --version  | print script version. Useful way of seeing if script/application exists |


## Processes

## Permissions
We can view the current permissions on a file with the command `ll` 

We have 2 ways of referring to permissions:
- long form 
- short form

Long form is what we see in the ll list. It's the first column. We can also use short form, which is numbers 

### Long form 

Represents the permissions as 3 sets of 3 letters. These are rwx – Read Write eXecute 

- First set is local, current user 
- Second set up other

here is an example
````shell
-rw-rw-r-- 1 ubuntu ubuntu   149 Apr 19 13:15  provision.sh 
````
Notice that there is no x for any user type. This is because currently no user can execute this shell script. 

We can change these permissions with `chmod`: 
````
chmod +x provision.sh 
````
This will give permissions to all users 

Short hand 

We can express these permission with a series of 3 numbers. For example: 

764		rwxrw-r-- 

Where read (4), write(2), execute(1) total up for each user. Note the product will always be unique to the permission type 

 

 

Chmod-calculator.com 

 

 

 
## Variables

## Networking and other 
| Command | Description                                                     |
| -----  | ---------------------------------------------------------------- |
| uname  | Print certain system information.  With no OPTION, same as -s.   |
| whoami | Print the user name associated with the current effective user ID.Same as id -un.
|        |
