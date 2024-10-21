THREE = require "three"

class Renderer extends THREE.WebGLRenderer

    constructor: ->

        super alpha: true, antialias: true, logarithmicDepthBuffer: true

        this.setSize window.innerWidth, window.innerHeight
        this.setPixelRatio window.devicePixelRatio

module.exports = Renderer
