express = require "express"

WebSocket = require "ws"
http = require "http"

path = require "path"

platform = "express"
host = "127.0.0.1"
port = "4000"

app = express()

server = http.createServer app
socket = new WebSocket.Server({ server })

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

socket.on "connection", (node) =>

    console.log "Node Connected"

    node.on "message", (message) =>

        console.log "Received: " + message

        node.send "Echo from server: " + message

    node.on "close", =>

        console.log "Node Disconnected"

server.listen port, =>

    console.log "Polysmith listening at " + host + ":" + port
