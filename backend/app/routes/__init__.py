from .user_routes import user_routes
from .schedule_routes import schedule_routes
from .notes_routes import notes_routes
from .auth_routes import auth_routes
from .quiz_routes import quiz_routes
def init_routes(app):
  app.register_blueprint(user_routes, url_prefix='/signup')
  app.register_blueprint(notes_routes, url_prefix='/notes')
  app.register_blueprint(auth_routes, url_prefix='/auth_routes')
  app.register_blueprint(schedule_routes, url_prefix='/schedule')


    

    app.register_blueprint(quiz_routes, url_prefix='/quiz')