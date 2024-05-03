# S3 and Blob Storage

S3 (Simple storage service) is AWS's blob storage storage solution. It has a number of uses, including:
- hosting a static website in the cloud
- storing data in an unstructured way

Blobs need to be stored inside of buckets on AWS. By default these blobs are private. There can be multiple blobs inside a buckets.

If a blob is public, then the URL/endpoint to access them is available from anywhere

Redundancy is built-in - copies of our buckets are stored as a back-up

We can access our buckets with:
- AWS console
- AWS CLI
- Python boto3

S3 supports CRUD operations


## Setting up our S3

1) set up an EC2 instance
2) SSH in, run update and upgrade
3) we need install:
   2) Python `sudo apt-get install python3`
   3) pip `sudo apt-get install python3-pip -y`
   4) AWS CLI `sudo pip install awscli`
4) We now check our aws command `aws --version`
5) NOTE: we can use aliases to get python to go to python3 `alias python=python3`
6) In order to let our EC2 instance interact with other services, inluding S3, we now need to create an access key file on our EC2 instance. Commands are:
   1) aws configure
      1) access key id
      2) secret access key
      3) default region name. This should be `eu-west-1`
      4) default output format. This should be `json`

We can check we can connect to S3 with the following command:
```
aws s3 ls
```

## Commands on S3
- `aws s3 ls` - lists 
- `aws s3 help` - help menu
- `aws s3 mb s3://<name of bucket> --region <region e.g. us-west-1>` - `aws s3 mb s3://tech258-joshg-first-bucket` - make a bucket in S3
- `aws s3 ls s3://tech258-joshg-first-bucket` - print contents of bucket
- `aws s3 cp <filename> s3://<bucket name>` - copy file contents to an S3 bucket
- `aws s3 sync s3://tech258-joshg-first-bucket .` - download files from s3 bucket to local machine
- `aws s3 rm s3://<name of bucket>/<name of file to remove>` - remove a file from S3 bucket
- `aws s3 rm s3://tech258-joshg-first-bucket --recursive` - delete all files in an S3 bucket :boom:
- `aws s3 rb s3://<bucket name>` - remove a bucket. Use `--force` if there are files in the bucket :boom:


## Boto3
Boto3 is the AWS SDK for Python. It allows us to interact with AWS services using Python code. 

With Boto3 we can create, configure, and manage AWS resources such as:
- EC2 instances
- S3 buckets
- DynamoDB tables
 
and much more directly from your Python scripts or applications. It provides a convenient and Pythonic way to interact with AWS services, making it easier to automate tasks and integrate AWS functionality into your applications.

we can install boto3 with the following command:
```
pip install boto3
```

### Using boto3

We can import boto3 and start using it right away in a python file. 

A quick way of creating python files in bash is with `tiny-vim`. This comes pre-installed in ubuntu and can be accessed using the command `vi`.
```python
import boto3
s3 = boto3.resource('s3')
for bucket in s3.buckets.all():
        print(bucket.name)

```

### Vim basics

Perhaps the most important concept in vim is the different modes. These are

Mode	Description 
Normal	Default; for navigation and simple editing
Insert	For explicitly inserting and modifying text
Command Line	For operations like saving, exiting, etc.

- We can got into **normal** mode by pressing the `Esc` key
- From normal mode we can enter **command line** mode by pressing the `:`. Some useful commands in **command line** mode are:
  - `:q!` - quit
  - `:x!` - save the file
  - `:set nu` - sets line numbers
- From normal mode was can also enter **insert mode** by pressing the `i` key.

### Python scripts



Create bucket
```python
import boto3

def create_bucket(bucket_name, region) -> None:
    """Create an S3 bucket in a specified region."""

    s3_client = boto3.client('s3', region)
    location = {'LocationConstraint': region}
    s3_client.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)


create_bucket('tech258-joshg-test-boto3', 'eu-west-1')

```


### Todo

Check this works: `export PYTHONPATH="/usr/bin/python3"`