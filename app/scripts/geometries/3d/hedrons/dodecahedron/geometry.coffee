# Link: hhttps://threejs.org/docs/#api/en/geometries/DodecahedronGeometry

class DodecahedronGeometry extends Geometry

    constructor : (radius = 5, detail = 0) ->

        super "dodecahedron",

            radius: radius
            detail: detail

class POLY.DodecahedronBufferGeometry extends THREE.DodecahedronBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5
        detail = if "detail" of params then params.detail else 0

        super radius, detail
