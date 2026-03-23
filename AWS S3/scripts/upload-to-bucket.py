import boto3

s3 = boto3.client('s3')

bucket_name = "tech601-jason-test-boto3"
file_name = "test.txt"
object_name = "test.txt"  # S3 key

# Upload file
s3.upload_file(file_name, bucket_name, object_name)

print(f"Uploaded {file_name} to {bucket_name}")