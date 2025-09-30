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
@notes_routes.route('/get', methods=['Get'])
def get_notes():
     try:
         note = NoteModel(current_app.mongo)
         note = note.list_all_note()
     except Exception as e:
         # If exception is raised, return error message and status code 400
         return jsonify({'messages':'Error', 'error': str(e)}), 400
     # If no exceptpion is raised, return good message and status code 200
     return jsonify(note), 200
