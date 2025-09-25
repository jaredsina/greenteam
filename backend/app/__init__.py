from flask import Flask

from models.schedule import ScheduleModel

def create_app():
  print("Creating Flask Application")
  app = Flask("Application")

  @app.route("/")
  def hello_world():
      return "<p>Hello, World!</p>"
  
  @app.get("/appointment")
  def get_appointment():
     return "Appointment"
  
  @app.post("/appointment")
  def post_appointment():
     return ScheduleModel.create_appointment()

  return app
  





