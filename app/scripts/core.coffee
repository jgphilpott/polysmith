THREE = require "three"

Navbar = require "./ui/navbar"
Forkme = require "./ui/forkme"

Strike = require "./anvil/strike"

socket = new WebSocket "ws://localhost:4000"

window.narbar = new Navbar()
window.forkme = new Forkme()

socket.addEventListener "open", (event) =>

    console.log "Open"

    socket.send "Hello from the client!"

socket.addEventListener "message", (event) =>

    console.log "Message from the server: " + event.data

socket.addEventListener "error", (event) =>

    console.error "WebSocket error observed: " + event.data

socket.addEventListener "close", (event) =>

    console.log "Close"

if window.location.page is "anvil"

    new Strike()
