# Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

class KnotGeometry extends Geometry

    constructor : (params = {}) ->

        super "knot", params

class POLY.KnotBufferGeometry extends THREE.TorusKnotBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 10
        thickness = params.thickness ?= 3

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        p = params.p ?= 2
        q = params.q ?= 3

        super radius, thickness, tubularSegments, radialSegments, p, q
