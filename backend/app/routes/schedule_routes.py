from unicodedata import category
from flask import Blueprint, jsonify, current_app,request
from models.note import NoteModel

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
        note_model = NoteModel(current_app.mongo)
        

        # subject might have multiple subjects, seperated by commas
        subjectList = subject.split(",")
        notes = []
        for category in subjectList:
            category_notes = note_model.list_notes_by_category(category.strip().lower().replace(" ", "_"))
            notes.append(category_notes)

        if not subject or not date or not startTime or not endTime:
            return jsonify({'error': 'Missing required data'}), 400
        else:
            return generate_schedule(subject, date, startTime, endTime, notes)
    else:
        return jsonify({'error': 'Invalid request'}), 400
# Push this github
# Add a body to the request so that you can input which subject it should make
# Look into how you can personalize the response more based on other inputfrom flask import Blueprint, jsonify, current_app,request

@schedule_routes.route("/create", methods=['POST','OPTIONS'])
def create_schedule():
    if request.method == 'OPTIONS':
        return jsonify({'message': "CORS preflight OK"}), 200

    try:
        data = request.get_json()
        user_id = data['user_id']
        date = data['date']
        free_hours = data['free_hours']
        start_time = data['start_time']
        end_time = data["end_time"]
        subject = data['subject']
        new_schedule = ScheduleModel(current_app.mongo)
        response = new_schedule.create_schedule(user_id,date,free_hours,subject,start_time,end_time)

    except Exception as e:
        print(e)
        return jsonify({'message': "Error posting schedule", 'error': str(e)})
    return jsonify(response), 201

@schedule_routes.route('/<string:user_id>', methods=['GET'])
def get_schedule_by_user_id(user_id):
    try:
        schedule_model = ScheduleModel(current_app.mongo)
        schedules = schedule_model.list_schedules_by_user_id(user_id)
    except Exception as e:
        return jsonify({'message': 'Error fetching schedule', 'error': str(e)}), 400
    return jsonify(schedules), 200

