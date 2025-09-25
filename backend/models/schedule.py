from flask_pymongo import PyMongo

class ScheduleModel:
    def _init_ (self, mongo: PyMongo):
        self.collection = mongo.cx["development"]["schedule"]

    def create_appointment (self, user_id, date, time, title):
        appointment_data = {
            "user_id": 1,
            "date": date,
            "time": time,
            "title": title
        }
        