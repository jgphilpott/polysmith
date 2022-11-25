# Link: https://threejs.org/docs/#api/en/geometries/OctahedronGeometry

class OctahedronGeometry extends Geometry

    constructor : (params = {}) ->

        super "octahedron", params

class POLY.OctahedronBufferGeometry extends THREE.OctahedronBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        detail = params.detail ?= 0

        super radius, detail
