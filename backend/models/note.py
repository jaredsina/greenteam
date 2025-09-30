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
    
    def get_note(self, note_id,user_id,catagory):
        return list( 
         result = self.collection.aggregate(
             [
                {"$match": {
                    "note_id": note_id,
                    "user_id": user_id,
                    "catagory": catagory
                    }},
                {
                    "$lookup":{
                        "from": "users",
                        "localField": "user_id",
                        'foreignField': "note_id",
                        "as":"user",
                        
                    }
                },
                {
                    "$project":{
                        'note_id':0,
                        "catagory":0,
                        "user_id":0
                    }
                }
             ]
         )
        )
    
    def list_user_note_by_id(self, note_id):
        return list(self.collection.find({"note_id":note_id}))

    def list_user_note_by_user(self, user_id):
        return list(self.collection.find)({"user_id":user_id})

    def list_user_note_by_catagory(self, catagory):
        return list(self.collection.find)({"catagory":catagory})
    
    def list_all_note(self):
        return list(
            self.collection.aggregate(
                [
                    {
                        "$project": {
                            "catagory": {"$toString":"$catagory"},
                            "note_id":{"$toString":"$note_id"},
                            "user_id":{"$toString":"$user_id"}
                        }
                    }
                ]
            )
        )
