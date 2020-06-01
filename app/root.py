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

urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/three.js/110/three.min.js", libs_dir + "/three.js")
urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/23f814719b2d199e324448751862f2a5fc7d27a5/examples/js/controls/OrbitControls.js", libs_dir + "/orbitControls.js")
urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/a72347515fa34e892f7a9bfa66a34fdc0df55954/examples/js/exporters/STLExporter.js", libs_dir + "/STLExporter.js")

urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/master/src/FileSaver.js", libs_dir + "/FileSaver.js")

compile(dirname=("app/sass", "app/css"))

app.run(host="0.0.0.0", port=4000, debug=True)
