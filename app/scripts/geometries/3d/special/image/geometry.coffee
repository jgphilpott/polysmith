# Link: https://threejs.org/docs/#api/en/geometries/ExtrudeGeometry

class ImageGeometry extends Geometry

    constructor : (mesh, file = "image", depth = 3, options = {}) ->

        super "image",

            mesh: mesh
            file: file

            depth: depth
            options: options

class POLY.ImageBufferGeometry

    constructor : (params) ->

        mesh = params.mesh

        loader = new THREE.SVGLoader()

        file = if "file" of params then params.file else "image"
        depth = if "depth" of params then params.depth else 3

        options = if "options" of params then params.options else

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
