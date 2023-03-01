import sys
from sqlalchemy import create_engine, text
import json
import os

import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


db_name = os.getenv('DBNAME')
db_user = os.getenv('DBUSER')
db_pass = os.getenv('DBPASS')
db_host = os.getenv('DBHOST')
db_port = '5432'

# Connecto to the database
db_string = f'postgresql://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}'
db = create_engine(db_string, isolation_level="AUTOCOMMIT")


logger.info("SUCCESS: Connection to RDS Postgres instance succeeded")


def lambda_handler(event, context):
    """
    This function creates a new RDS database table and writes records to it
    """
    message = event['Records'][0]['body']
    data = json.loads(message)
    CustID = data['CustID']
    Name = data['Name']

    item_count = 0
    sql_string = f"insert into Customer (CustID, Name) values({CustID}, '{Name}')"

    with db.connect() as cur:
        cur.execute(text(
            "CREATE TABLE IF NOT EXISTS Customer (CustID int NOT NULL, Name varchar(255) NOT NULL, PRIMARY KEY (CustID))"))
        cur.execute(text(sql_string))
        response = cur.execute(text("select * from Customer"))
        result = response.fetchall()
        logger.info("The following items have been added to the database:")
        for row in result:
            item_count += 1
            logger.info(row)

    return "Added %d items to RDS MySQL table" % (item_count)
