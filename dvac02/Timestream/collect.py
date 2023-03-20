import time
import boto3
import psutil
import socket
from botocore.config import Config


HOSTNAME = socket.gethostname()
TABLE_NAME = ""
DATABASE_NAME = ""
INTERVAL = 5  # Seconds


def prepare_common_attributes():
    common_attributes = {
        'Dimensions': [
            {'Name': 'hostname', 'Value': HOSTNAME}
        ],
        'MeasureName': 'utilization',
        'MeasureValueType': 'MULTI'
    }
    return common_attributes


def prepare_record(current_time):
    record = {
        'Time': str(current_time),
        'MeasureValues': []
    }
    return record


def prepare_measure(measure_name, measure_value):
    measure = {
        'Name': measure_name,
        'Value': str(measure_value),
        'Type': 'DOUBLE'
    }
    return measure


def write_records(records, common_attributes):
    try:
        result = write_client.write_records(DatabaseName=DATABASE_NAME,
                                            TableName=TABLE_NAME,
                                            CommonAttributes=common_attributes,
                                            Records=records)
        status = result['ResponseMetadata']['HTTPStatusCode']
        print("Processed %d records. WriteRecords HTTPStatusCode: %s" %
              (len(records), status))
    except Exception as err:
        print("Error:", err)


if __name__ == '__main__':

    print("writing data to database {} table {}".format(
        DATABASE_NAME, TABLE_NAME))

    session = boto3.Session()
    write_client = session.client('timestream-write', config=Config(
        read_timeout=20, max_pool_connections=5000, retries={'max_attempts': 10}))
    query_client = session.client('timestream-query')  # Not used

    common_attributes = prepare_common_attributes()

    records = []

    while True:

        current_time = int(time.time() * 1000)
        cpu_utilization = psutil.cpu_percent()
        memory_utilization = psutil.virtual_memory().percent
        swap_utilization = psutil.swap_memory().percent
        disk_utilization = psutil.disk_usage('/').percent

        record = prepare_record(current_time)
        record['MeasureValues'].append(prepare_measure('cpu', cpu_utilization))
        record['MeasureValues'].append(
            prepare_measure('memory', memory_utilization))
        record['MeasureValues'].append(
            prepare_measure('swap', swap_utilization))
        record['MeasureValues'].append(
            prepare_measure('disk', disk_utilization))

        records.append(record)

        print("records {} - cpu {} - memory {} - swap {} - disk {}".format(
            len(records), cpu_utilization, memory_utilization,
            swap_utilization, disk_utilization))

        if len(records) == 10:
            write_records(records, common_attributes)
            records = []

        time.sleep(INTERVAL)
