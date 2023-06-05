import csv
from random import randint
import names
from datetime import datetime
import boto3
s3 = boto3.client('s3')


def create_csv_for_s3():
    row_len = randint(1, 100)
    row_list = [["id", "name", "age"]]
    id_counter = 0
    for r in range(row_len):
        id_counter += 1
        row_list.append([id_counter, names.get_full_name(), randint(0, 100)])

    # print(row_list)

    filename = f'customers-{datetime.now().strftime("%Y-%m-%d-%H%M%S")}.csv'
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(row_list)
    upload_if_not_exists(filename, 'cahcetest', filename)
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
