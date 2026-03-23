import boto3

s3 = boto3.client('s3')

bucket_name = "tech601-jason-test-boto3"
object_name = "test.txt"
download_path = "downloaded_test.txt"

s3.download_file(bucket_name, object_name, download_path)

print(f"Downloaded {object_name} to {download_path}")