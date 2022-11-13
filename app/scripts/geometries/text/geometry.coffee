# Link: https://threejs.org/docs/#examples/en/geometries/TextGeometry

class TextGeometry extends Geometry

    constructor : (mesh, text = "Text", font = "ubuntu", size = 12, height = 3, options = {}) ->

        super "text",

            mesh: mesh

            text: text
            font: font

            size: size
            height: height

            options: options

class POLY.TextBufferGeometry

    constructor : (params) ->

        mesh = params.mesh

        loader = new THREE.FontLoader()

        text = if "text" of params then params.text else "Text"
        font = if "font" of params then params.font else "ubuntu"

        size = if "size" of params then params.size else 12
        height = if "height" of params then params.height else 3

        options = if "options" of params then params.options else

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
