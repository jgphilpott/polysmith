from pymongo import MongoClient

def mongo_client():

    return MongoClient("database", 27017)
