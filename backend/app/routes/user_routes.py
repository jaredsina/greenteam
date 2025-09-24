from flask import Blueprint, jsonify, current_app, request
from app.models.user import UserModel

user_routes = Blueprint("user_routes", __name__)

@user_routes.route("/create", methods=['POST'])
def create_users():
  try:
    username = request.form.get("username")
    password = request.form.get("password")

    user_model = UserModel(current_app.mongo)
    response = user_model.create_user(
      username,
      password,
    )
  except Exception as e:
        return jsonify({"message": "Error creating user", "error": str(e)}), 400

  return jsonify(
        {"message": "User created successfully", "user_id": str(response)}
    ), 201