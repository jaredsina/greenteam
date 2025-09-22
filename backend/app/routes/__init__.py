from .user_routes import user_routes
def init_routes(app):
  app.register_blueprint(user_routes, url_prefix='/signlog')




from .notes_routes import notes_routes
def init_routes(app):
    app.register_blueprint(notes_routes, url_prefix='/notes')
