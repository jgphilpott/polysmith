# Link: https://github.com/mrdoob/three.js/blob/309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83/examples/js/loaders/SVGLoader.js

class SVGLoader extends THREE.SVGLoader

    constructor: ->

        super()

    import: (file) ->

        shapes = []

        for path in file.paths

            Array.prototype.push.apply shapes, path.toShapes()

        geometry = new THREE.ExtrudeBufferGeometry shapes, {}
        material = new MeshMaterial "normal"

        mesh = new THREE.Mesh geometry, material

        return [mesh]
