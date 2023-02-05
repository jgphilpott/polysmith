from mongo.data.collect.ions import mongo_collection

collection = mongo_collection("models")

def add_model(model):

    return str(collection.insert_one(model).inserted_id)

def add_models(models):

    return str(collection.insert_many(models).inserted_ids)

def find_model(query={}, filter={"_id": 0}):

    return dict(collection.find_one(query, filter))

def find_models(query={}, filter={"_id": 0}, sort=[("id", 1)], limit=0):

    collection.create_index(sort)

    return list(collection.find(query, filter).sort(sort).limit(limit))

def update_model(model):

    return collection.update_one({"id": model["id"]}, {"$set": model})

def update_models(models):

    for model in models:

        model = update_model(model)

    return models

def delete_model(model):

    return collection.delete_one({"id": model["id"]})

def delete_models(models):

    for model in models:

        model = delete_model(model)

    return models
