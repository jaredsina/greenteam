from flask_pymongo import PyMongo
from bson import ObjectId

class NoteModel:
    def __init__(self, mongo: PyMongo):
        self.collection = mongo.cx["development"]["notes"]

    def create_note(self, user_id, note, catagory):
        note_data = {
            'user_id': user_id,
            'note': note,
            'catagory': catagory
        }
        result = self.collection.insert_one(note_data)
        return str(result.inserted_id)
    
    def list_notes_by_category(self, catagory):
        notes = list(self.collection.find({'catagory': catagory}))
        for n in notes:
            n['_id'] = str(n['_id'])  # make ObjectId JSON serializable
        return notes
