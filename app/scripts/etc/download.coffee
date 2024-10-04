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

fetch = (url, path) =>

    if not fs.existsSync path

        file = fs.createWriteStream path

        https.get(url, (response) =>

            response.pipe file

            file.on "finish", =>

                console.log "File downloaded as " + path

                file.close()

        ).on("error", (error) =>

            console.error "Error downloading file " + error.message

            fs.unlink path

        )

fetch("https://gist.githubusercontent.com/jgphilpott/12783015d68e056e54252355d75b41a9/raw/3c1e6931cdad0006570e7c68ed3de8ac5746213c/abbreviations.css", cssLibs + "/abbreviations.css")
fetch("https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.min.css", cssLibs + "/jQueryUI.css")
