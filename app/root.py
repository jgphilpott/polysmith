from os import urandom
from os import makedirs
from os.path import exists
from subprocess import Popen

from flask import Flask, render_template

from urllib.request import urlretrieve

from sass import compile

app = Flask("Polymaker", template_folder="app", static_folder="app")

app.jinja_env.auto_reload = True
app.config["SECRET_KEY"] = urandom(42).hex()

@app.route("/")
def home():

    return render_template("html/home.html")

libs_dir = "app/libs"

if not exists(libs_dir):

    makedirs(libs_dir)

    urlretrieve("https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js", libs_dir + "/jQuery.js")

    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/three.js/r124/three.min.js", libs_dir + "/three.js")
    urlretrieve("https://raw.githubusercontent.com/jeromeetienne/threex.domevents/1100828c40df668a82a97c811895918088cc607f/threex.domevents.js", libs_dir + "/threeX.js")

    urlretrieve("https://gist.githubusercontent.com/jgphilpott/03df747c3047504480e6dbeeddd27d68/raw/e6708feb515affff5884032d703ea67f03a283fe/csgWrapper.mjs", libs_dir + "/csgWrapper.mjs")
    urlretrieve("https://gist.githubusercontent.com/jgphilpott/59ad8432ba8567e91176e669454b9afa/raw/4d115791d9d1d632cc758b07826c00add7ada3dd/meshOperations.mjs", libs_dir + "/meshOperations.mjs")

    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/OBJLoader.js", libs_dir + "/OBJLoader.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/STLLoader.js", libs_dir + "/STLLoader.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/SVGLoader.js", libs_dir + "/SVGLoader.js")

    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/exporters/OBJExporter.js", libs_dir + "/OBJExporter.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/exporters/STLExporter.js", libs_dir + "/STLExporter.js")

    urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/b5e61ec88969461ce0504658af07c2b56650ee8c/src/FileSaver.js", libs_dir + "/FileSaver.js")

    urlretrieve("https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js", libs_dir + "/numeric.js")

compile(dirname=("app/sass", "app/css"), output_style="compressed")
Popen(["boussole", "watch"], cwd="app/config")

app.run(host="0.0.0.0", port=4000, debug=True)
