from dotenv import load_dotenv
import os
from flask_pymongo import PyMongo
load_dotenv()

def init_config(app):
  app.config['MONGO_URI'] = os.getenv('DB_URI')

  mongo = PyMongo(app)
  app.mongo = mongo
  
  try:
    mongo.cx.admin.command('ping')
    print('MongoDB connection sucessfull')
  except Exception as e:
    print(f"MongoDB connection failed: {e}")

