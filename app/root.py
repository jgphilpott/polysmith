from os import makedirs
from os.path import exists

from flask import Flask, render_template

from urllib.request import urlretrieve

from sass import compile

app = Flask("shapeMaker", template_folder="app", static_folder="app")

@app.route("/")
def home():

    return render_template("html/home.html")

libs_dir = "app/libs"

if not exists(libs_dir):

    makedirs(libs_dir)

urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js", libs_dir + "/jQuery.js")

compile(dirname=("app/sass", "app/css"))

app.run(host="0.0.0.0", port=4000, debug=True)
