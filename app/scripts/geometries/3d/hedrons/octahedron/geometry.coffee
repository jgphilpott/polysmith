# Link: https://threejs.org/docs/#api/en/geometries/OctahedronGeometry

class OctahedronGeometry extends Geometry

    constructor : (radius = 5, detail = 0) ->

        super "octahedron",

            radius: radius
            detail: detail

class POLY.OctahedronBufferGeometry extends THREE.OctahedronBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5
        detail = if "detail" of params then params.detail else 0

        super radius, detail
