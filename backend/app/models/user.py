from flask_pymongo import PyMongo

class UserModel:
  def __init__ (self, mongo: PyMongo):
    self.collection = mongo.cx["development"]["user"]

  
  def create_user(self, username, password):
    user_data = {"username": username, "password": password}

    # Puts the user in the database
    result = self.collection.insert_one(user_data)
    return str(result.inserted_id)
  

  def find_user(self, username):
    result = self.collection.find_one({"username": username},{"_id": {"$toString": "$_id"},"username": 1, "password": 1})
    return result
  

