import boto3

s3 = boto3.client('s3')

bucket_name = "tech601-jason-test-boto3"
file_key = "test.txt"

s3.delete_object(Bucket=bucket_name, Key=file_key)
print(f"Deleted file: {file_key}")