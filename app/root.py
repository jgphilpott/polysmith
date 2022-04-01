from os import urandom
from os import makedirs
from os.path import exists
from subprocess import Popen

from flask import Flask, render_template
from mongo.socket.plug import plugin

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

js_libs_dir = libs_dir + "/js"
css_libs_dir = libs_dir + "/css"

if not exists(libs_dir):

    makedirs(libs_dir)

    makedirs(js_libs_dir)
    makedirs(css_libs_dir)

    makedirs(js_libs_dir + "/exporters")
    makedirs(js_libs_dir + "/importers")

    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js", js_libs_dir + "/sha256.js")
    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.4.0/socket.io.min.js", js_libs_dir + "/socket.js")

    urlretrieve("https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css", css_libs_dir + "/jQuery-UI.css")
    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js", js_libs_dir + "/jQuery.js")
    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js", js_libs_dir + "/jQueryUI.js")

    urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/three.js/r124/three.min.js", js_libs_dir + "/three.js")
    urlretrieve("https://raw.githubusercontent.com/jgphilpott/threex.domevents/master/threex.domevents.js", js_libs_dir + "/threeX.js")

    urlretrieve("https://gist.githubusercontent.com/jgphilpott/03df747c3047504480e6dbeeddd27d68/raw/e6708feb515affff5884032d703ea67f03a283fe/csgWrapper.mjs", js_libs_dir + "/csgWrapper.mjs")
    urlretrieve("https://gist.githubusercontent.com/jgphilpott/59ad8432ba8567e91176e669454b9afa/raw/4d115791d9d1d632cc758b07826c00add7ada3dd/meshOperations.mjs", js_libs_dir + "/meshOperations.mjs")

    urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/b5e61ec88969461ce0504658af07c2b56650ee8c/src/FileSaver.js", js_libs_dir + "/FileSaver.js")

    commit = "670b1e9e85356d98efa4c702e93c85dd52f01e1e"
    exporters = ["ColladaExporter.js", "DRACOExporter.js", "GLTFExporter.js", "MMDExporter.js", "OBJExporter.js", "PLYExporter.js", "STLExporter.js"]
    importers = ["3MFLoader.js", "AMFLoader.js", "ColladaLoader.js", "DRACOLoader.js", "FBXLoader.js", "GLTFLoader.js", "MMDLoader.js", "OBJLoader.js", "PLYLoader.js", "STLLoader.js", "SVGLoader.js", "VRMLLoader.js"]

    for exporter in exporters:

        urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/" + commit + "/examples/js/exporters/" + exporter, js_libs_dir + "/exporters/" + exporter)

    for importer in importers:

        urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/" + commit + "/examples/js/loaders/" + importer, js_libs_dir + "/importers/" + importer)

    with open(js_libs_dir + "/math.js", "w") as file:

        numeric = get("https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js").content.decode("utf-8")
        calc = get("https://gist.githubusercontent.com/jgphilpott/4276345a5b7c96fc010afa28cc5d38b6/raw/26c8d0b1217c0e6dbf771fc80fd22dd3a35cb963/calculus.js").content.decode("utf-8")
        regr = get("https://gist.githubusercontent.com/jgphilpott/d38279e8fac9af31054e10b7363bf17e/raw/3684fcc69634970a75b1fa454b1a0f7b3c2c1a03/regression.js").content.decode("utf-8")
        roots = get("https://gist.githubusercontent.com/jgphilpott/e483b5fbe52a7233c292f35737e5a682/raw/d85ccaecf7d6b606809764b39f841a063c9a1fdc/roots.js").content.decode("utf-8")
        trig = get("https://gist.githubusercontent.com/jgphilpott/1378cc2cccde6d65c5fb2b6111b5a98f/raw/587408f905ba1da6fcc970cb095bdf129ffa308b/trigonometry.js").content.decode("utf-8")
        angles = get("https://gist.githubusercontent.com/jgphilpott/092c0f3e1bcfa75f543e8485b9b23e7d/raw/813b2b7ac4c3cbcfc5caec5eec3600bba3bf5edc/angleConverter.js").content.decode("utf-8")
        scaling = get("https://gist.githubusercontent.com/jgphilpott/6332dc7f5636db9ba455e1575407c496/raw/b72589532af0b7c63e321b15254acbb848248209/scaling.js").content.decode("utf-8")

        math = numeric + "\n" + calc + "\n" + regr + "\n" + roots + "\n" + trig + "\n" + angles + "\n" + scaling

        file.write(math)

    with open(js_libs_dir + "/tools.js", "w") as file:

        camalize = get("https://gist.githubusercontent.com/jgphilpott/19e7a94cdf6d6d4cd868cc18e628026c/raw/2c5d68bb84f0d4e14478bcac359a77137f6a25f5/camalize.js").content.decode("utf-8")
        rotation = get("https://gist.githubusercontent.com/jgphilpott/1bc17b82063f14fabb8f3e38825f6f10/raw/b5ddf5f386213f47ac4fd4b9f41bc116b37f29a3/rotation.js").content.decode("utf-8")
        distance = get("https://gist.githubusercontent.com/jgphilpott/da9da7d8bdfb32982f99d9910efb1410/raw/51b50b26fc144e3cd2e2849ad47b280d5d1152f5/distanceConversion.js").content.decode("utf-8")
        cookieFuncs = get("https://gist.githubusercontent.com/jgphilpott/b9ce64b9ef8b04c5ac58902b133b1a28/raw/8931a5cd26c48945e932a7399f853b593687f557/cookieFunctions.js").content.decode("utf-8")
        localStorage = get("https://gist.githubusercontent.com/jgphilpott/e26b92eb41b64e9565032d5c4d3c2878/raw/593ae1721ca986210862da158db663f21dec42af/localStorage.js").content.decode("utf-8")
        validEmail = get("https://gist.githubusercontent.com/jgphilpott/a1ffedea1d1a70320b8075597df1943a/raw/29b8f25b2a439a117783523f209ba42ef5e9cf9d/validEmail.js").content.decode("utf-8")
        format = get("https://gist.githubusercontent.com/jgphilpott/787659ac4ea57a9971da58a76191079b/raw/d87c450947083ab134999408cec38fb70756593a/numberFormater.js").content.decode("utf-8")
        subset = get("https://gist.githubusercontent.com/jgphilpott/a1367ca419ac2807ed4340d69356b7f1/raw/48ad3970a6a370853d18157142421ab02b1e2398/subset.js").content.decode("utf-8")

        tools = camalize + "\n" + rotation + "\n" + distance + "\n" + cookieFuncs + "\n" + localStorage + "\n" + validEmail + "\n" + format + "\n" + subset

        file.write(tools)

compile(dirname=("app/sass", "app/css"), output_style="compressed")
Popen(["boussole", "watch"], cwd="app/config")

plugin(app).run(app, host="0.0.0.0", port=4000, debug=True)
