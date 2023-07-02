# Link: https://threejs.org/docs/#api/en/geometries/RingGeometry

class RingGeometry extends Geometry

    constructor: (params = {}) ->

        super "ring", params

class POLY.RingBufferGeometry extends THREE.RingBufferGeometry

    constructor: (params = {}) ->

        innerRadius = adaptor "convert", "length", 2.5
        outerRadius = adaptor "convert", "length", 5

        angleUnit = settings.get "scales.angle.unit"
        thetaLength = convert.angle["radian"][angleUnit] Math.PI * 2

        innerRadius = params.innerRadius ?= innerRadius
        outerRadius = params.outerRadius ?= outerRadius

        thetaSegments = params.thetaSegments ?= 42
        phiSegments = params.phiSegments ?= 1

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        innerRadius = adaptor "invert", "length", innerRadius
        outerRadius = adaptor "invert", "length", outerRadius

        thetaStart = convert.angle[angleUnit]["radian"] thetaStart
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        super innerRadius, outerRadius, thetaSegments, phiSegments, thetaStart, thetaLength
