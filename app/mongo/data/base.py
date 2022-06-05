from mongo.client import mongo_client

client = mongo_client()
database = client.polymorph

def mongo_database():

    return database
