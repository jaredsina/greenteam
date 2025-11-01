from flask import Blueprint, jsonify, current_app,request
#from app.models.judge import 
from flask_jwt_extended import jwt_required
# used to convert string to ObjectId
from ai.main import generate_true_false_quiz, generate_written_response_quiz, generate_multiple_choice_quiz
quiz_routes = Blueprint('quiz_routes',__name__)

@quiz_routes.post('/generate')
def post_generate_quiz():
    if request.is_json:
        data = request.get_json()
        difficulty = data.get('difficulty')
        length = data.get('length')
        type = data.get('type')
        topic = data.get('topic')
        if not difficulty or not length or not type or not topic:
            return jsonify({'error': 'Missing required data'}), 400
        else:
            if type=="True/False":
                return generate_true_false_quiz(difficulty,length,type,topic)
            elif type == "Written Response":
                return generate_written_response_quiz(difficulty,length,type,topic)
            elif type == "Multiple Choice":
                return generate_multiple_choice_quiz(difficulty,length,type,topic)
            else:
                return jsonify({'error': 'Invalid Quiz Type'}), 400

    else:
        return jsonify({'error': 'Invalid request'}), 400
