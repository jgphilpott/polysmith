from os import urandom

class Client():

    def __init__(self, client):

        self.email = client["email"]
        self.password = client["password"]

        if "id" in client:

            self.id = client["id"]

        else:

            self.id = None

        if "settings" in client:

            self.settings = client["settings"]

        else:

            self.settings = {}
