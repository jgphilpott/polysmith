class Canvas

    constructor: ->

        @element = document.body.appendChild window.renderer.domElement

        this.element.setAttribute "id", "canvas"

module.exports = Canvas
