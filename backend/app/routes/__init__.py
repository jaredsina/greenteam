from .schedule_routes import schedule_routes
from .notes_routes import notes_routes
def init_routes(app):
    app.register_blueprint(notes_routes, url_prefix='/notes')
    app.register_blueprint(schedule_routes, url_prefix='/schedule')