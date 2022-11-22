# Link: https://threejs.org/docs/#api/en/geometries/IcosahedronGeometry

class IcosahedronGeometry extends Geometry

    constructor : (params = {}) ->

        super "icosahedron", params

class POLY.IcosahedronBufferGeometry extends THREE.IcosahedronBufferGeometry

    constructor : (params) ->

        radius = params.radius ?= 5
        detail = params.detail ?= 0

        super radius, detail
