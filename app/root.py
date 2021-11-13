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

    urlretrieve("https://raw.githubusercontent.com/evanw/csg.js/a8512afbac3cf503195870f7ef11c0a32f36c6d4/csg.js", libs_dir + "/csg.js")
    urlretrieve("https://raw.githubusercontent.com/kraag22/csg-wrapper/1d2182b6265282ea9f1f3d66bd4c0bb2b87a232b/ThreeCSG.js", libs_dir + "/csgWrapper.js")
    urlretrieve("https://gist.githubusercontent.com/jgphilpott/59ad8432ba8567e91176e669454b9afa/raw/381ceef76f9b0e69b492910306434c6f52ba420d/meshOperations.js", libs_dir + "/meshOperations.js")

    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/8880636d522afded0c481a59ef2815c11ed64bda/examples/js/loaders/OBJLoader.js", libs_dir + "/OBJLoader.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/8880636d522afded0c481a59ef2815c11ed64bda/examples/js/loaders/STLLoader.js", libs_dir + "/STLLoader.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/8880636d522afded0c481a59ef2815c11ed64bda/examples/js/loaders/SVGLoader.js", libs_dir + "/SVGLoader.js")

    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/8880636d522afded0c481a59ef2815c11ed64bda/examples/js/exporters/OBJExporter.js", libs_dir + "/OBJExporter.js")
    urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/8880636d522afded0c481a59ef2815c11ed64bda/examples/js/exporters/STLExporter.js", libs_dir + "/STLExporter.js")

    urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/b5e61ec88969461ce0504658af07c2b56650ee8c/src/FileSaver.js", libs_dir + "/FileSaver.js")

    urlretrieve("https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js", libs_dir + "/numeric.js")

    urlretrieve("https://gist.githubusercontent.com/jgphilpott/6332dc7f5636db9ba455e1575407c496/raw/b72589532af0b7c63e321b15254acbb848248209/scaling.js", libs_dir + "/tools.js")

compile(dirname=("app/sass", "app/css"), output_style="compressed")
Popen(["boussole", "watch"], cwd="app/config")

app.run(host="0.0.0.0", port=4000, debug=True)
