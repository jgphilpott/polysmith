# Link: https://threejs.org/docs/#api/en/geometries/ExtrudeGeometry

class ImageGeometry extends Geometry

    constructor: (params = {}) ->

        super "image", params

class POLY.ImageBufferGeometry

    constructor: (params = {}) ->

        mesh = params.mesh

        loader = new THREE.SVGLoader()

        depth = adaptor "convert", "length", 3

        bevelSize = adaptor "convert", "length", 0.1
        bevelOffset = adaptor "convert", "length", 0
        bevelThickness = adaptor "convert", "length", 0.1

        image = params.image ?= "image"

        steps = params.steps ?= 1
        depth = params.depth ?= depth
        center = params.center ?= true

        bevelEnabled = params.bevelEnabled ?= false
        bevelSize = params.bevelSize ?= bevelSize
        bevelOffset = params.bevelOffset ?= bevelOffset
        bevelThickness = params.bevelThickness ?= bevelThickness

        bevelSegments = params.bevelSegments ?= 3
        curveSegments = params.curveSegments ?= 12

        depth = adaptor "invert", "length", depth

        bevelSize = adaptor "invert", "length", bevelSize
        bevelOffset = adaptor "invert", "length", bevelOffset
        bevelThickness = adaptor "invert", "length", bevelThickness

        loader.load "./app/imgs/svg/" + image + ".svg", (image) =>

            options = params.options ?=

                steps: steps
                depth: depth
                bevelEnabled: bevelEnabled
                bevelSize: bevelSize
                bevelOffset: bevelOffset
                bevelThickness: bevelThickness
                bevelSegments: bevelSegments
                curveSegments: curveSegments

            shapes = []

            for path in image.paths

                Array.prototype.push.apply shapes, path.toShapes()

            geometry = new THREE.ExtrudeBufferGeometry shapes, options
            geometry = new Geometry3D "async", geometry: geometry

            if center then geometry.center()

            mesh.geometry.dispose()
            mesh.geometry = geometry

        return new THREE.Geometry()
