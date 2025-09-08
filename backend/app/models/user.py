from flask_pymongo import PyMongo

class UserModel:
  def __init__ (self, mongo: PyMongo):
    self.collection = mongo.cx["development"]["user"]

  def create_user(username, password, self):
    user_data = {"username": username, "password": password}
    result = self.collection.insert_one(user_data)
    return str(result.inserted_id)
  
  

