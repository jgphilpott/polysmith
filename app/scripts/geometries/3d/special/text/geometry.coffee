# Link: https://threejs.org/docs/#examples/en/geometries/TextGeometry

class TextGeometry extends Geometry

    constructor: (params = {}) ->

        super "text", params

class POLY.TextBufferGeometry

    constructor: (params = {}) ->

        mesh = params.mesh

        loader = new THREE.FontLoader()

        text = params.text ?= "Text"
        font = params.font ?= "ubuntu"

        size = params.size ?= 12
        height = params.height ?= 3

        options = params.options ?=

            center: true
            curveSegments: 12
            bevelEnabled: false
            bevelThickness: 1
            bevelSize: 1
            bevelOffset: 0
            bevelSegments: 3

        loader.load "./app/fonts/JSON/" + font + ".json", (font) ->

            options.font = font

            options.size = size
            options.height = height

            geometry = new THREE.TextBufferGeometry text, options

            if options.center

                geometry.center()

            mesh.geometry.dispose()
            mesh.geometry = geometry

        return new THREE.Geometry()
