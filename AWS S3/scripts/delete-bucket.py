import boto3

s3 = boto3.client('s3')

bucket_name = "tech601-jason-test-boto3"

s3.delete_bucket(Bucket=bucket_name)

print(f"Deleted bucket: {bucket_name}")