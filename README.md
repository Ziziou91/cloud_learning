# Cloud Learning
This document explores concepts crucial to both virtual instances and cloud computing through the setup of a web server on a fresh EC2 instance on AWS. 

As well as describing the steps required to set up the aformentioned server, I'll use the steps required as a jumping-off point to explore key ideas when appropiate. Topics I'll cover include:
1) Virtual Machines
2) EC2 Instances
    - Managing Instances 
    - Using Bash to interact with EC2 instances
3) SSH key pairs on AWS
4) Networking and ports  
5) Basic Linux commands
6) Nginx

Topics will be clearly titled as they are introduced

## AWS EC2 Deployment Guide
Before creating our EC2 instance on AWS, it's worth outlining why we would want to create a virtual machine in the cloud. Let's start by looking at virtual machines:

### What are virtual machines
**Virtual machines (VMs)** are software-based emulations of physical computers. They allow you to run multiple instances of an operating system, and all of the other required software we need, on a single machine. 

**Virtualisation** is the act of creating virtual computing instances, with their own compute cores, memory, storage and OS.  

Thanks to an abundance of memory, compute and storage, the servers managed by cloud providers give us a great environment to spin up and scale virtual machines. 

### Amazon Elastic Compute Cloud (EC2)
Amazon Elastic Compute Cloud (EC2) is a web service provided by Amazon Web Services (AWS) that offers resizable compute capacity in the cloud. EC2 allows users to easily launch virtual machines, known as **instances**, and scale resources according to requirements. 

We can configure our EC2 instances with various operating systems, CPU, memory, storage, and networking options, providing great flexibility and customization.

## Setting up our EC2 instance

