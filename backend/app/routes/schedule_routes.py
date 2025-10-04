from flask import Blueprint, jsonify, current_app,request
#from app.models.judge import 
from flask_jwt_extended import jwt_required
from models.schedule import ScheduleModel
# used to convert string to ObjectId
from bson import ObjectId
from ai.main import generate_schedule

schedule_routes = Blueprint('schedule_routes',__name__)

@schedule_routes.post('/generate')
def post_generate_schedule():
    if request.is_json:
        data = request.get_json()
        subject = data.get('subject')
        date = data.get('date')
        startTime = data.get('startTime')
        endTime = data.get('endTime')
        if not subject or not date or not startTime or not endTime:
            return jsonify({'error': 'Missing required data'}), 400
        else:
            return generate_schedule(subject, date, startTime, endTime)
    else:
        return jsonify({'error': 'Invalid request'}), 400
# Push this github
# Add a body to the request so that you can input which subject it should make
# Look into how you can personalize the response more based on other inputfrom flask import Blueprint, jsonify, current_app,request

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
