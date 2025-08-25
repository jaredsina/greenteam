from flask import Blueprint, jsonify, current_app,request
#from app.models.judge import NoteModel
from flask_jwt_extended import jwt_required
from models.note import NoteModel
# used to convert string to ObjectId
from bson import ObjectId
notes_routes = Blueprint('notes_routes',__name__)

def post_note():
    try:
        data = request.get_json()  
        user_id = ObjectId(data['user_id'])
        note = ObjectId(data['note'])
        new_note = NoteModel(current_app.mongo)
        response = new_note.create_note(user_id, note)

    except Exception as e:
        return jsonify({'message': 'Error posting note', 'error': str(e)}), 400
    return jsonify(response), 200
# #Define route in blueprint
# @notes_routes.route('/')
# def get_notes():
#     try:
#         new_Note = NoteModel(current_app.mongo)
#         notes = new_Note.list_all_judges()

#     except Exception as e:
#         # If exception is raised, return error message and status code 400
#         return jsonify({'messages':'Error', 'error': str(e)}), 400
#     # If no exceptpion is raised, return good message and status code 200
#     return jsonify(notes), 200
# @notes_routes.route('/<string:note_id>')
# def get_note(note_id):
#     try:
#         # will get note_id from the request json
#         # need to convert string to ObjectId to match the data type in database
#         note_id = ObjectId(note_id)
#         new_note = NoteModel(current_app.mongo)
#         judge = new_note.find_judge_by_id(note_id)

#     except Exception as e:
#         # if a exeception is raised than error message and status code 400
#         return jsonify({'message': 'Error getting note', 'error': str(e)}), 400
#     # if no exceptions is raised than good message and status code 200
#     return jsonify(note), 200

# @notes_routes.route('/delete/<string:judge_id>', methods=['DELETE'])
# @jwt_required()
# def delete_note(note_id):
#     try:
#         #need to convert string to ObjectId so data type match database
#         note_id = ObjectId(note_id)
#         new_note = NoteModel(current_app.mongo)
#         response = new_note.delete_note(note_id)

#     except Exception as e:
#         # if exception is raised error message and status code 400
#         return jsonify({'message':"Error deleting note", 'error': str(e)}), 400
#     # If no exception is rasied good message and status code 200
#     return jsonify({'notes_id': str(note_id)}), 200

# @notes_routes.route('/update/<string:note_id>', methods=['PUT'])
# @jwt_required()
# def update_note(note_id):
#     try:
#         # will get note_id from request json
#         data = request.get_json()
#         # updated_note = data['notes_save']
#         update_note = {
#             'notes_save': ObjectId(data['notes_save']),
#             'algebra_save': ObjectId(data['algebra_save']),
#         }
#         new_note = NoteModel(current_app.mongo)
#         response = new_note.update_note(note_id,update_note)

#     except Exception as e:
        
#         print(e)
#         #what the error message will say
#         return jsonify({'message': 'Error updating notes', 'error': str(e)}), 400
#     # what success message will say and status code 201
#     return jsonify({**update_note, '_id': note_id}), 201

