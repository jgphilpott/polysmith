# Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

class CircleGeometry extends Geometry

    constructor: (params = {}) ->

        super "circle", params

class POLY.CircleBufferGeometry extends THREE.CircleBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        angleUnit = settings.get "scales.angle.unit"
        thetaLength = convert.angle["radian"][angleUnit] Math.PI * 2

        radius = params.radius ?= radius
        segments = params.segments ?= 42

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        radius = adaptor "invert", "length", radius
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        super radius, segments, thetaStart, thetaLength
