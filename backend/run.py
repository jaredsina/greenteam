from flask import Flask

app = Flask("Application")

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

app.run(port=4000,debug=True)

print("Hello")





