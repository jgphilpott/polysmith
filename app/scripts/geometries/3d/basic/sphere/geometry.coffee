# Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

class SphereGeometry extends Geometry

    constructor: (params = {}) ->

        super "sphere", params

class POLY.SphereBufferGeometry extends THREE.SphereBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5

        angleUnit = settings.get "scales.angle.unit"
        phiLength = convert.angle["radian"][angleUnit] Math.PI * 2
        thetaLength = convert.angle["radian"][angleUnit] Math.PI

        radius = params.radius ?= radius

        widthSegments = params.widthSegments ?= 42
        heightSegments = params.heightSegments ?= 42

        phiStart = params.phiStart ?= 0
        phiLength = params.phiLength ?= phiLength

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        radius = adaptor "invert", "length", radius

        phiStart = convert.angle[angleUnit]["radian"] phiStart
        phiLength = convert.angle[angleUnit]["radian"] phiLength

        thetaStart = convert.angle[angleUnit]["radian"] thetaStart
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        super radius, widthSegments, heightSegments, phiStart, phiLength, thetaStart, thetaLength
