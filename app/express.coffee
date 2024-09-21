express = require "express"
path = require "path"

host = "127.0.0.1"
port = "4000"

app = express()

app.set "view engine", "pug"
app.set "views", path.join(__dirname, "templates")

app.use express.static path.join(__dirname, "")

app.get "/", (request, responce) =>

    responce.render "anvil", mode: "express"

app.listen port, =>

    console.log "Polysmith listening at http://localhost:" + port
