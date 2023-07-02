# Link: https://threejs.org/docs/#api/en/geometries/OctahedronGeometry

class OctahedronGeometry extends Geometry

    constructor: (params = {}) ->

        super "octahedron", params

class POLY.OctahedronBufferGeometry extends THREE.OctahedronBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        detail = params.detail ?= 0
        radius = params.radius ?= radius

        radius = adaptor "invert", "length", radius

        super radius, detail
