import boto3


#param order is bucket, object, output filename
s3 = boto3.client('s3')
s3.download_file('knox-def-bucket', 'upload.txt', 'download.txt')
