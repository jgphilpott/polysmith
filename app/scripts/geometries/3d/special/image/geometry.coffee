# Link: https://threejs.org/docs/#api/en/geometries/ExtrudeGeometry

class ImageGeometry extends Geometry

    constructor : (params = {}) ->

        super "image", params

class POLY.ImageBufferGeometry

    constructor : (params = {}) ->

        mesh = params.mesh

        loader = new THREE.SVGLoader()

        file = params.file ?= "image"
        depth = params.depth ?= 3

        options = params.options ?=

            steps: 1
            center: true
            curveSegments: 12
            bevelEnabled: false
            bevelThickness: 1
            bevelSize: 1
            bevelOffset: 0
            bevelSegments: 3

        loader.load "./app/imgs/svg/" + file + ".svg", (file) ->

            shapes = []

            options.depth = depth

            for path in file.paths

                Array.prototype.push.apply shapes, path.toShapes()

            geometry = new THREE.ExtrudeBufferGeometry shapes, options

            if options.center

                geometry.center()

            mesh.geometry.dispose()
            mesh.geometry = geometry

        return new THREE.Geometry()
