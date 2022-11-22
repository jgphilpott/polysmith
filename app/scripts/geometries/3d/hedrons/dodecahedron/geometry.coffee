# Link: hhttps://threejs.org/docs/#api/en/geometries/DodecahedronGeometry

class DodecahedronGeometry extends Geometry

    constructor : (params = {}) ->

        super "dodecahedron", params

class POLY.DodecahedronBufferGeometry extends THREE.DodecahedronBufferGeometry

    constructor : (params) ->

        radius = params.radius ?= 5
        detail = params.detail ?= 0

        super radius, detail
