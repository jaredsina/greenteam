from flask import Blueprint, jsonify, current_app,request

from ai.main import generate_schedule

schedule_routes = Blueprint('schedule_routes',__name__)

@schedule_routes.post('/generate')
def post_generate_schedule():
    return generate_schedule("History")

# Push this github
# Add a body to the request so that you can input which subject it should make
# Look into how you can personalize the response more based on other input