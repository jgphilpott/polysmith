from mongo.data.base import mongo_database

database = mongo_database()

def mongo_collection(collection):

    return database[collection]

def mongo_collections():

    return database.list_collection_names()
