from flask import Flask

def create_app():
  print("Creating Flask Application")
  app = Flask("Application")

  @app.route("/")
  def hello_world():
      return "<p>Hello, World!</p>"
  return app
  





