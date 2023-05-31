# Link: https://github.com/mrdoob/three.js/blob/309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83/examples/js/exporters/STLExporter.js

class STLExporter extends THREE.STLExporter

    constructor: ->

        super()

        @extension = "stl"
