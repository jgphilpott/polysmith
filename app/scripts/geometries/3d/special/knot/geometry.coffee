# Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

class TorusKnotGeometry extends Geometry

    constructor : (params = {}) ->

        super "knot", params

class POLY.TorusKnotBufferGeometry extends THREE.TorusKnotBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 10
        thickness = params.thickness ?= 3

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        p = params.p ?= 2
        q = params.q ?= 3

        super radius, thickness, tubularSegments, radialSegments, p, q
