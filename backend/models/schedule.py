from flask_pymongo import PyMongo


class ScheduleModel:
    def __init__(self, mongo:PyMongo):
        self.collection = mongo.cx ['development']["schedule"]

    def create_schedule(self, user_id, free_hours, date, subject):
        schedule_data = {
            'user_id':user_id,
            'free_hours':free_hours,
            'date':date,
            'subject':subject
        }
        result = self.collection.insert_one(schedule_data)
        return str(result.inserted_id)