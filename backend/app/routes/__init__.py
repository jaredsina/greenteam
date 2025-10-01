from .notes_routes import notes_routes
def init_routes(app):
    app.register_blueprint(notes_routes, url_prefix='/notes')