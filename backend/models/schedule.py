from flask_pymongo import PyMongo


class ScheduleModel:
    def __init__(self, mongo:PyMongo):
        self.collection = mongo.cx ['development']["schedule"]

    def create_schedule(self, user_id, free_hours, date, subject, start_time, end_time):
        schedule_data = {
            'user_id':user_id,
            'free_hours':free_hours,
            'start_time':start_time,
            'end_time':end_time,
            'date':date,
            'subject':subject
        }
        result = self.collection.insert_one(schedule_data)
        return str(result.inserted_id)
    
    def list_schedules_by_user_id(self, user_id):
        schedules = list(self.collection.find({'user_id': int(user_id)}))
        for s in schedules:
            s['_id'] = str(s['_id'])
        return schedules
