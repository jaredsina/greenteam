from flask import Blueprint, jsonify, current_app,request
#from app.models.judge import NoteModel
from flask_jwt_extended import jwt_required
from models.note import NoteModel
# used to convert string to ObjectId
from bson import ObjectId

notes_routes = Blueprint('notes_routes',__name__)

@notes_routes.route('/post', methods=['POST'])
def post_note():
    try:
        data = request.get_json()  
        # user_id = ObjectId(data['user_id'])
        user_id = data['user_id']
        note = data['note']
        catagory = data['catagory']
        new_note = NoteModel(current_app.mongo)
        response = new_note.create_note(user_id, note, catagory)
    
    except Exception as e:
        print(e)
        return jsonify({'message': 'Error posting note', 'error': str(e)}), 400
    return jsonify(response), 201

# #Define route in blueprint
@notes_routes.route('/get/<string:catagory>', methods=['GET'])
def get_notes_by_category(catagory):
    try:
        note_model = NoteModel(current_app.mongo)
        notes = note_model.list_notes_by_category(catagory)
    except Exception as e:
        return jsonify({'message': 'Error fetching notes', 'error': str(e)}), 400
    return jsonify(notes), 200
