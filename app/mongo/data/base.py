from mongo.client import mongo_client

client = mongo_client()
database = client.polymaker

def mongo_database():

    return database
