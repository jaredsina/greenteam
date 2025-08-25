from flask import Flask
from .routes import init_routes
from .config import init_config
from flask_cors import CORS
def create_app():

  print("Creating Flask Application")
  app = Flask("Application")

  CORS(app, supports_credentials=True)

  init_routes(app)
  init_config(app)


  return app
  





