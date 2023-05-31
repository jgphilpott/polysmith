# Link: https://github.com/mrdoob/three.js/blob/309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83/examples/js/exporters/DRACOExporter.js

class DRACOExporter extends THREE.DRACOExporter

    constructor: ->

        super()

        @extension = "drc"
