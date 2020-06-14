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
urlretrieve("https://raw.githubusercontent.com/evanw/csg.js/a8512afbac3cf503195870f7ef11c0a32f36c6d4/csg.js", libs_dir + "/csg.js")
urlretrieve("https://raw.githubusercontent.com/kraag22/csg-wrapper/1d2182b6265282ea9f1f3d66bd4c0bb2b87a232b/ThreeCSG.js", libs_dir + "/csgWrapper.js")
urlretrieve("https://gist.githubusercontent.com/jgphilpott/59ad8432ba8567e91176e669454b9afa/raw/381ceef76f9b0e69b492910306434c6f52ba420d/meshOperations.js", libs_dir + "/meshOperations.js")
urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/23f814719b2d199e324448751862f2a5fc7d27a5/examples/js/controls/OrbitControls.js", libs_dir + "/orbitControls.js")
urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/a72347515fa34e892f7a9bfa66a34fdc0df55954/examples/js/exporters/STLExporter.js", libs_dir + "/STLExporter.js")

urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/master/src/FileSaver.js", libs_dir + "/FileSaver.js")

compile(dirname=("app/sass", "app/css"))

app.run(host="0.0.0.0", port=4000, debug=True)
