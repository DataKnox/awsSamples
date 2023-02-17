from sqlalchemy import create_engine, text
import os
from dotenv import load_dotenv
import discord
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

db_name = os.getenv('DBNAME')
db_user = os.getenv('DBUSER')
db_pass = os.getenv('DBPASS')
db_host = os.getenv('DBHOST')
db_port = '5432'

# Connecto to the database
db_string = f'postgresql://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}'
db = create_engine(db_string, isolation_level="AUTOCOMMIT")
intents = discord.Intents.default()
intents.message_content = True

client = discord.Client(intents=intents)


@client.event
async def on_ready():
    print(f'We have logged in as {client.user}')


@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content.startswith('$hello'):
        con = db.connect()
        sql = f"""
SELECT
    name,
    homeplanetid
FROM
    people;
"""
        print("executing sql")
        logger.info("executing sql")
        response = con.execute(text(sql))
        print(response)
        logger.info(response)
        result = response.fetchall()
        tatooine_people = [person[0] for person in result if person[1] == 1]
        await message.channel.send(tatooine_people)
client.run(TOKEN)
