from flask_pymongo import PyMongo

class NoteModel:
    def __init__(self, mongo: PyMongo):
        self.collection = mongo.cx["development"]["notes"]

    def create_note(self, user_id, note):
        note_data = {
            'user_id': user_id,
            'note': note
        }
        result = self.collection.insert_one(note_data)
        return str(result.inserted_id)