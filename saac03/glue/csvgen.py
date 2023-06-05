import csv
from random import randint
import names
from datetime import datetime
import time


def create_csv_for_s3():
    row_len = randint(20, 100)
    row_list = [["id", "name", "age", "salesamt", "salestime"]]
    id_counter = 0
    for r in range(row_len):
        id_counter += 1
        row_list.append([id_counter, names.get_full_name(),
                        randint(0, 100), randint(0, 10000), time.time()])

    # print(row_list)

    filename = f'customers-{datetime.now().strftime("%Y-%m-%d-%H%M%S")}.csv'
    with open(filename, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerows(row_list)
    print(f"Created {filename}")


if __name__ == "__main__":
    create_csv_for_s3()
