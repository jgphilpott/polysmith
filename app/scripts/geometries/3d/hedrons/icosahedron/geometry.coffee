# Link: https://threejs.org/docs/#api/en/geometries/IcosahedronGeometry

class IcosahedronGeometry extends Geometry

    constructor : (radius = 5, detail = 0) ->

        super "icosahedron",

            radius: radius
            detail: detail

class POLY.IcosahedronBufferGeometry extends THREE.IcosahedronBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5
        detail = if "detail" of params then params.detail else 0

        super radius, detail
