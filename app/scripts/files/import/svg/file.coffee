# Link: https://github.com/mrdoob/three.js/blob/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/SVGLoader.js

class SVGLoader extends THREE.SVGLoader

    constructor: ->

        super()

    import: (file) ->

        shapes = []

        paths = file.paths

        for path in paths

            Array.prototype.push.apply shapes, path.toShapes()

        geometry = new THREE.ExtrudeBufferGeometry shapes, {}
        material = new MeshMaterial "normal"

        mesh = new THREE.Mesh geometry, material

        return [mesh]
