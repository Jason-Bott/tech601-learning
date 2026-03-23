import boto3

bucket_name = "tech601-jason-test-boto3"  # change this

s3 = boto3.client('s3')

response = s3.create_bucket(
    Bucket=bucket_name,
    CreateBucketConfiguration={
        'LocationConstraint': 'eu-west-1'  # change if needed
    }
)

print(f"Bucket created: {bucket_name}")