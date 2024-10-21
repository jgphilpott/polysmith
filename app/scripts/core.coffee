THREE = require "three"

Navbar = require "./ui/navbar"
Forkme = require "./ui/forkme"

Strike = require "./anvil/strike"

window.narbar = new Navbar()
window.forkme = new Forkme()

new Strike()
