# S3 (Simple Storage )

## Commands

### Installation/Setup

Install pip:

> sudo apt install python3-pip -y

Install venv:

> sudo apt install python3-venv -y

Setup venv:

> python3 -m venv venv

Activate venv:

> source ./venv/bin/activate

Install awscli:

> pip install awscli

Install boto3:

> pip install boto3

### AWS Bucket Management

Configue aws (Access key, secret access key, region, output file type):

> aws configure

Look at buckets:

> aws s3 ls

Make bucket:

> aws s3 mb s3://tech601-jason-first-bucket

Upload file to bucket:

> aws s3 cp test.txt s3://tech601-jason-first-bucket

Download all files from bucket:

> aws s3 sync s3://tech601-jason-first-bucket .

Remove file from bucket:

> aws s3 rm s3://tech601-jason-first-bucket/test.txt

Remove everything from bucket:

> aws s3 rm s3://tech601-jason-first-bucket --recursive

Remove bucket (Must be empty):

> aws s3 rb s3://tech601-jason-first-bucket

Force remove bucket:

> aws s3 rb s3://tech601-jason-first-bucket --force