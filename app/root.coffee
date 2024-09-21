express = require("express")

app = express()
port = 4000

app.get "/", (request, responce) =>

    responce.send "Polysmith!"

app.listen port, () =>

    console.log "Polysmith listening at http://localhost:" + port
