express = require "express"
path = require "path"

host = "127.0.0.1"
port = "4000"

app = express()
platform = "express"

app.set "view engine", "pug"
app.set "views", path.join(__dirname, "templates")

app.use express.static path.join(__dirname, "")

app.get "/", (request, responce) =>

    responce.redirect "/anvil"

app.get "/anvil", (request, responce) =>

    responce.render "pages/anvil", platform: platform

app.get "/docs", (request, responce) =>

    responce.render "pages/docs", platform: platform

app.get "/tutorials", (request, responce) =>

    responce.render "pages/tutorials", platform: platform

app.listen port, =>

    console.log "Polysmith listening at http://localhost:" + port
