# Link: https://github.com/mrdoob/three.js/blob/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/exporters/STLExporter.js

class STLExporter extends THREE.STLExporter

    constructor : () ->

        super()

        @extension = "stl"
