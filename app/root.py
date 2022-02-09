from os import urandom
from os import makedirs
from os.path import exists
from subprocess import Popen

from flask import Flask, render_template

from requests import get
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

    with open(libs_dir + "/math.js", "w") as file:

        numeric = get("https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js").content.decode("utf-8")
        calc = get("https://gist.githubusercontent.com/jgphilpott/4276345a5b7c96fc010afa28cc5d38b6/raw/26c8d0b1217c0e6dbf771fc80fd22dd3a35cb963/calculus.js").content.decode("utf-8")
        regr = get("https://gist.githubusercontent.com/jgphilpott/d38279e8fac9af31054e10b7363bf17e/raw/3684fcc69634970a75b1fa454b1a0f7b3c2c1a03/regression.js").content.decode("utf-8")
        roots = get("https://gist.githubusercontent.com/jgphilpott/e483b5fbe52a7233c292f35737e5a682/raw/d85ccaecf7d6b606809764b39f841a063c9a1fdc/roots.js").content.decode("utf-8")
        trig = get("https://gist.githubusercontent.com/jgphilpott/1378cc2cccde6d65c5fb2b6111b5a98f/raw/587408f905ba1da6fcc970cb095bdf129ffa308b/trigonometry.js").content.decode("utf-8")

        math = numeric + "\n" + calc + "\n" + regr + "\n" + roots + "\n" + trig

        file.write(math)

compile(dirname=("app/sass", "app/css"), output_style="compressed")
Popen(["boussole", "watch"], cwd="app/config")

app.run(host="0.0.0.0", port=5000, debug=True)
