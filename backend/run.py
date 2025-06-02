from app import create_app

print("Starting server")

if __name__=="__main__":
  app = create_app()
  app.run(port=4000,debug=True)










