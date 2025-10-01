from flask import Blueprint, jsonify, current_app,request
#from app.models.judge import 
from flask_jwt_extended import jwt_required
from models.schedule import ScheduleModel
# used to convert string to ObjectId
from bson import ObjectId


schedule_routes = Blueprint('schedule_routes', __name__)

@schedule_routes.route("/create", methods=['POST','OPTIONS'])
def create_schedule():
    if request.method == 'OPTIONS':
        return jsonify({'message': "CORS preflight OK"}), 200

    try:
        data = request.get_json()
        user_id = data['user_id']
        date = data['date']
        free_hours = data['free_hours']
        subject = data['subject']
        new_schedule = ScheduleModel(current_app.mongo)
        response = new_schedule.create_schedule(user_id,date,free_hours,subject)

    except Exception as e:
        print(e)
        return jsonify({'message': "Error posting schedule", 'error': str(e)})
    return jsonify(response), 201
