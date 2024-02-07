# Link: https://threejs.org/docs/#api/en/geometries/DodecahedronGeometry

class DodecahedronGeometry extends Geometry

    constructor: (params = {}) ->

        super "dodecahedron", params

class POLY.DodecahedronBufferGeometry extends THREE.DodecahedronBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        detail = params.detail ?= 0
        radius = params.radius ?= radius

        radius = adaptor "invert", "length", radius

        super radius, detail
