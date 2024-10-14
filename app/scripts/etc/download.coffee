fs = require "fs"
path = require "path"
https = require "https"

libs = path.join __dirname, "../../libs"

jsLibs = libs + "/js"
cssLibs = libs + "/css"

exporters = jsLibs + "/exporters"
importers = jsLibs + "/importers"

if not fs.existsSync libs then fs.mkdirSync libs

if not fs.existsSync jsLibs then fs.mkdirSync jsLibs
if not fs.existsSync cssLibs then fs.mkdirSync cssLibs

if not fs.existsSync exporters then fs.mkdirSync exporters
if not fs.existsSync importers then fs.mkdirSync importers

fetch = (urls, path) =>

    if fs.existsSync path

        fs.unlinkSync path

    file = fs.createWriteStream path

    for url in urls

        https.get(url, (response) =>

            response.on "data", (chunk) =>

                file.write chunk

            response.on "end", =>

                console.log "Finished downloading from " + url

        ).on("error", (error) =>

            console.error "Error downloading file " + error.message

        )

    file.on "finish", =>

        console.log "All content saved to " + path

        file.close()

fetch(["https://gist.githubusercontent.com/jgphilpott/a1367ca419ac2807ed4340d69356b7f1/raw/86260257a88408a2e1bfa23ffe44a28bf13546eb/array.js",
       "https://gist.githubusercontent.com/jgphilpott/a876171a09ce00e450d7f4325542d819/raw/341d17a032715dfbbd3fb7d00a0ba3f426b4333b/boolean.js",
       "https://gist.githubusercontent.com/jgphilpott/6332dc7f5636db9ba455e1575407c496/raw/39366e458fe38ee301e78ecbd660227a85c45f71/number.js",
       "https://gist.githubusercontent.com/jgphilpott/c4e0c275c808ae1a01386942dfc2a225/raw/11057a3a277b9a38d2c48c2c9496dc5f91dadc4b/string.js"], jsLibs + "/prototype.js")

fetch(["https://gist.githubusercontent.com/jgphilpott/12783015d68e056e54252355d75b41a9/raw/3c1e6931cdad0006570e7c68ed3de8ac5746213c/abbreviations.js",
       "https://gist.githubusercontent.com/jgphilpott/787659ac4ea57a9971da58a76191079b/raw/cbea41bf2d74b5ce4d1d0629d168fc799a6c48cc/format.js",
       "https://gist.githubusercontent.com/jgphilpott/b9ce64b9ef8b04c5ac58902b133b1a28/raw/5a8c863d59be464289bcee3e6363c0d025b050dd/cookies.js",
       "https://gist.githubusercontent.com/jgphilpott/e26b92eb41b64e9565032d5c4d3c2878/raw/7fe4d19aad1e765f134a45e128dbfe1cad1141aa/localStorage.js",
       "https://gist.githubusercontent.com/jgphilpott/a1ffedea1d1a70320b8075597df1943a/raw/a91ee941914fedcafd12d892ed98f7ee43cb9bba/email.js",
       "https://gist.githubusercontent.com/jgphilpott/efdec642fc8bbaaae8115bd4fc49bd05/raw/4fc20edc7d3927e55159cf97980d37d9b9adfb70/faviconScheme.js",
       "https://gist.githubusercontent.com/jgphilpott/d339fa0571cbe0e55a411caca87d2ece/raw/fc9dd92d373a167202ab658868dfb08c94804211/fullscreen.js",
       "https://gist.githubusercontent.com/jgphilpott/68e9e22ea6ac5bf44ff7a86ef75b5e5d/raw/f414e0b9fbc64f8d71440979358239ee6c40d117/page.js",
       "https://gist.githubusercontent.com/jgphilpott/83e40b7418954766e5b994d0f85e98d6/raw/899921469b580fe31edc178c5ba12932761600c7/jQueryPlus.js",
       "https://gist.githubusercontent.com/jgphilpott/e6716046f4225629f7f82fe878909f35/raw/3d26a50bb11784dfa6e5eb601c3a06839262c29f/LodashPlus.js"], jsLibs + "/tools.js")

fetch(["https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js",
       "https://gist.githubusercontent.com/jgphilpott/4276345a5b7c96fc010afa28cc5d38b6/raw/1005b9c02b1697d974b33b4b64d956d8f29838b7/calculus.js",
       "https://gist.githubusercontent.com/jgphilpott/d38279e8fac9af31054e10b7363bf17e/raw/3555aab46e57a9ccf367d00d336e526349aa0f42/regression.js",
       "https://gist.githubusercontent.com/jgphilpott/e483b5fbe52a7233c292f35737e5a682/raw/4dee678d7c8f7577305aa30058a39ffd3502ae0c/roots.js",
       "https://gist.githubusercontent.com/jgphilpott/1378cc2cccde6d65c5fb2b6111b5a98f/raw/4ca9d6644932bef8a61b5ed9805fc124b020f2c5/trigonometry.js"], jsLibs + "/math.js")

fetch(["https://gist.githubusercontent.com/jgphilpott/12783015d68e056e54252355d75b41a9/raw/3c1e6931cdad0006570e7c68ed3de8ac5746213c/abbreviations.css"], cssLibs + "/abbreviations.css")
fetch(["https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.min.css"], cssLibs + "/jQueryUI.css")
