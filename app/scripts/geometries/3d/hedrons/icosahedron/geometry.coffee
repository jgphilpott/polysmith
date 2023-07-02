# Link: https://threejs.org/docs/#api/en/geometries/IcosahedronGeometry

class IcosahedronGeometry extends Geometry

    constructor: (params = {}) ->

        super "icosahedron", params

class POLY.IcosahedronBufferGeometry extends THREE.IcosahedronBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        detail = params.detail ?= 0
        radius = params.radius ?= radius

        radius = adaptor "invert", "length", radius

        super radius, detail
