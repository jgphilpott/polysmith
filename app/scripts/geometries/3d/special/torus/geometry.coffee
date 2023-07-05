# Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

class TorusGeometry extends Geometry

    constructor: (params = {}) ->

        super "torus", params

class POLY.TorusBufferGeometry extends THREE.TorusBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5
        thickness = adaptor "convert", "length", 1

        angleUnit = settings.get "scales.angle.unit"
        arc = convert.angle["radian"][angleUnit] Math.PI * 2

        arc = params.arc ?= arc

        radius = params.radius ?= radius
        thickness = params.thickness ?= thickness

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        arc = convert.angle[angleUnit]["radian"] arc

        radius = adaptor "invert", "length", radius
        thickness = adaptor "invert", "length", thickness

        super radius, thickness, radialSegments, tubularSegments, arc
