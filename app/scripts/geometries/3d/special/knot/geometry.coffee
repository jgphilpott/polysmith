# Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

class KnotGeometry extends Geometry

    constructor: (params = {}) ->

        super "knot", params

class POLY.KnotBufferGeometry extends THREE.TorusKnotBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5
        thickness = adaptor "convert", "length", 1

        p = params.p ?= 2
        q = params.q ?= 3

        radius = params.radius ?= radius
        thickness = params.thickness ?= thickness

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        radius = adaptor "invert", "length", radius
        thickness = adaptor "invert", "length", thickness

        super radius, thickness, tubularSegments, radialSegments, p, q
