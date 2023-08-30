# Link: https://threejs.org/docs/#examples/en/geometries/TextGeometry

class TextGeometry extends Geometry

    constructor: (params = {}) ->

        super "text", params

class POLY.TextBufferGeometry

    constructor: (params = {}) ->

        mesh = params.mesh

        loader = new THREE.FontLoader()

        size = adaptor "convert", "length", 12
        height = adaptor "convert", "length", 3

        bevelSize = adaptor "convert", "length", 0.1
        bevelOffset = adaptor "convert", "length", 0
        bevelThickness = adaptor "convert", "length", 0.1

        text = params.text ?= "Text"
        font = params.font ?= "ubuntu"

        size = params.size ?= size
        height = params.height ?= height
        center = params.center ?= true

        bevelEnabled = params.bevelEnabled ?= false
        bevelSize = params.bevelSize ?= bevelSize
        bevelOffset = params.bevelOffset ?= bevelOffset
        bevelThickness = params.bevelThickness ?= bevelThickness

        bevelSegments = params.bevelSegments ?= 3
        curveSegments = params.curveSegments ?= 12

        size = adaptor "invert", "length", size
        height = adaptor "invert", "length", height

        bevelSize = adaptor "invert", "length", bevelSize
        bevelOffset = adaptor "invert", "length", bevelOffset
        bevelThickness = adaptor "invert", "length", bevelThickness

        loader.load "./app/fonts/JSON/" + font + ".json", (font) =>

            options =

                font: font
                size: size
                height : height
                bevelEnabled: bevelEnabled
                bevelSize: bevelSize
                bevelOffset: bevelOffset
                bevelThickness: bevelThickness
                bevelSegments: bevelSegments
                curveSegments: curveSegments

            geometry = new THREE.TextBufferGeometry text, options
            geometry = new Geometry3D "async", geometry: geometry

            if center then geometry.center()

            mesh.geometry.dispose()
            mesh.geometry = geometry

        return new THREE.Geometry()
