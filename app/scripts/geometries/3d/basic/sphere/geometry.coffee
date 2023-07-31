# Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

class SphereGeometry extends Geometry

    constructor: (params = {}) ->

        super "sphere", params

class POLY.SphereBufferGeometry extends THREE.SphereBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        angleUnit = settings.get "scales.angle.unit"
        thetaLength = convert.angle["radian"][angleUnit] Math.PI * 2
        phiLength = convert.angle["radian"][angleUnit] Math.PI

        radius = params.radius ?= radius

        thetaSegments = params.thetaSegments ?= 42
        phiSegments = params.phiSegments ?= 42

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        phiStart = params.phiStart ?= 0
        phiLength = params.phiLength ?= phiLength

        radius = adaptor "invert", "length", radius

        thetaStart = convert.angle[angleUnit]["radian"] thetaStart
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        phiStart = convert.angle[angleUnit]["radian"] phiStart
        phiLength = convert.angle[angleUnit]["radian"] phiLength

        super radius, thetaSegments, phiSegments, thetaStart, thetaLength, phiStart, phiLength
