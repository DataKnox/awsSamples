import boto3

s3 = boto3.client('s3')
s3.download_file('knox-def-bucket', 'upload.txt', 'upload.txt')
