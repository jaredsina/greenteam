from flask import Blueprint, jsonify, current_app,request

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