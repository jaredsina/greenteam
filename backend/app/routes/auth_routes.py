from flask import Blueprint, jsonify, current_app, request
from app.models.judge import UserModel
from flask_jwt_extended import jwt_required


from bson import ObjectId

auth_routes = Blueprint("signlog_routes", __name__)


# Define a simple route inside this blueprint
@auth_routes.route("/post", methods=['POST'])
def post_signlog():
    try:
        data = request.get_json()
        username = data['username']
        password = data['password']

        user = UserModel(current_app.mongo)

    except Exception as e:
        # If an exception is raised, return an error message and status code 400
        return jsonify({"message": "Error getor9ting user", "error": str(e)}), 400

    # If no exceptions are raised, return a success message and status code 200
    return jsonify(user), 200
