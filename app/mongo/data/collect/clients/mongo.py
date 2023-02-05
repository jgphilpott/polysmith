from mongo.data.collect.ions import mongo_collection

collection = mongo_collection("clients")

def add_client(client):

    return str(collection.insert_one(client).inserted_id)

def add_clients(clients):

    return str(collection.insert_many(clients).inserted_ids)

def find_client(query={}, filter={"_id": 0}):

    return dict(collection.find_one(query, filter))

def find_clients(query={}, filter={"_id": 0}, sort=[("email", 1)], limit=0):

    collection.create_index(sort)

    return list(collection.find(query, filter).sort(sort).limit(limit))

def update_client(client):

    return collection.update_one({"email": client["email"]}, {"$set": client})

def update_clients(clients):

    for client in clients:

        client = update_client(client)

    return clients

def delete_client(client):

    return collection.delete_one({"email": client["email"]})

def delete_clients(clients):

    for client in clients:

        client = delete_client(client)

    return clients

def valid_client(id):

    try:

        return find_client({"id": id}, {"_id": 0, "id": 0, "password": 0})

    except:

        return None
