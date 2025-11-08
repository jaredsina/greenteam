from flask import Blueprint, jsonify, current_app, request
from app.models.user import UserModel

auth_routes = Blueprint("signlog_routes", __name__)


# Define a simple route inside this blueprint
@auth_routes.route("/post", methods=['POST'])
def post_signlog():
    try:
        data = request.get_json()

        # Receives data from the phone login requests
        username = data['username']
        password = data['password']
        user_model = UserModel(current_app.mongo)
        response = user_model.find_user(username)
        if response:
            if password == response["password"]:
                return jsonify(response), 200
            else:
                return jsonify({"message": "Passwords don't match", "error": str(e)}), 400
        else:
            return jsonify({"message": "Error: user not found", "error": str(e)}), 400

    except Exception as e:
        # If an exception is raised, return an error message and status code 400
        return jsonify({"message": "Error getor9ting user", "error": str(e)}), 400

    # If no exceptions are raised, return a success message and status code 200
    return jsonify(response), 200
