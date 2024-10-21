Canvas = require "./canvas"
Renderer = require "./renderer"
Scene = require "./scene"

class Strike

    constructor: ->

        window.renderer = new Renderer()
        window.canvas = new Canvas()
        window.scene = new Scene()

        animate = (time) =>

            window.renderer.render window.scene, window.camera

        window.renderer.setAnimationLoop animate

module.exports = Strike
