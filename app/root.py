from flask import Flask, render_template

app = Flask("shapeMaker", template_folder="app", static_folder="app")

@app.route("/")
def home():

    return render_template("html/home.html")

app.run(host="0.0.0.0", port=4000, debug=True)
