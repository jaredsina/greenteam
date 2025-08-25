from flask import Flask
from .routes import init_routes
from .config import init_config

def create_app():
  print("Creating Flask Application")
  app = Flask("Application")

  init_routes(app)
  init_config(app)
  return app
  





