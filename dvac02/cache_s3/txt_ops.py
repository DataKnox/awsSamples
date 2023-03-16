from datetime import datetime
import boto3
from essential_generators import DocumentGenerator
s3 = boto3.client('s3')


def create_csv_for_s3():
    gen = DocumentGenerator()
    data = gen.sentence()

    filename = f'customers-{datetime.now().strftime("%Y-%m-%d-%H-%M-%S")}.txt'
    with open(filename, 'w', newline='') as file:
        file.write(data)
    upload_if_not_exists(filename, 'object-cache', filename)
    print(f"Created {filename}")


def upload_if_not_exists(filename=None, bucket=None, object_name=None):
    if filename is None:
        filename = 'upload.txt'
    if bucket is None:
        bucket = 'cahcetest'
    response = s3.list_objects(Bucket=bucket)
    record = [k for k in response.get('Contents')
              if k.get('Key') == object_name]
    if len(record) < 1:
        s3.upload_file(filename, bucket, object_name)
        print(f"Uploaded {filename} to {bucket} as {object_name}")
    else:
        print(f"File {object_name} already exists in {bucket}")


if __name__ == "__main__":
    create_csv_for_s3()
