import boto3

s3 = boto3.resource('s3')

# Create a new bucket if it doesn't exist


def create_bucket(bucket_name, region='us-east-2'):
    if s3.Bucket(bucket_name) not in s3.buckets.all():
        location = {'LocationConstraint': region}
        s3.create_bucket(Bucket=bucket_name,
                         CreateBucketConfiguration=location)
        print("Bucket created: " + bucket_name)
    else:
        print("Bucket already exists: " + bucket_name)

# Create a new public that is readable by everyone


def create_public_bucket(bucket_name, region='us-east-2'):
    if s3.Bucket(bucket_name) not in s3.buckets.all():
        location = {'LocationConstraint': region}
        s3.create_bucket(Bucket=bucket_name, ACL='public-read',
                         CreateBucketConfiguration=location)
        print("Public bucket created: " + bucket_name)
    else:
        print("Bucket already exists: " + bucket_name)

# Create a new private bucket that is readable by the owner only


def create_private_bucket(bucket_name, region='us-east-2'):
    if s3.Bucket(bucket_name) not in s3.buckets.all():
        location = {'LocationConstraint': region}
        s3.create_bucket(Bucket=bucket_name, ACL='private',
                         CreateBucketConfiguration=location)
        print("Private bucket created: " + bucket_name)
    else:
        print("Bucket already exists: " + bucket_name)


create_bucket('knox-def-bucket')
create_public_bucket('knox-public-bucket')
create_private_bucket('knox-private-bucket')

# Retrieve the list of existing buckets
s3c = boto3.client('s3')
response = s3c.list_buckets()

# Output the bucket names
print('Existing buckets:')
for bucket in response['Buckets']:
    print(f'  {bucket["Name"]}')
