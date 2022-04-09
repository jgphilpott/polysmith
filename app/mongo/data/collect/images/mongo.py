from mongo.data.collect.ions import mongo_collection

collection = mongo_collection("images")

def new_image(image):

    return str(collection.insert_one(image).inserted_id)

def new_images(images):

    return str(collection.insert_many(images).inserted_ids)

def find_image(query={}, filter={"_id": 0}):

    return dict(collection.find_one(query, filter))

def find_images(query={}, filter={"_id": 0}, sort=[("id", 1)], limit=0):

    collection.create_index(sort)

    return list(collection.find(query, filter).sort(sort).limit(limit))

def update_image(image):

    return collection.update_one({"id": image["id"]}, {"$set": image})

def update_images(images):

    for image in images:

        update_image(image)

def delete_image(image):

    return collection.delete_one({"id": image["id"]})

def delete_images(images):

    for image in images:

        delete_image(image)
