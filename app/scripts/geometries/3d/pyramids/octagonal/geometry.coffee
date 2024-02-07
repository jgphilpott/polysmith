# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class OctagonalPyramidGeometry extends Geometry

    constructor: (params = {}) ->

        super "octagonal-pyramid", params

class POLY.OctagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = adaptor "convert", "length", 5
        height = adaptor "convert", "length", 10

        angleUnit = settings.get "scales.angle.unit"
        thetaLength = convert.angle["radian"][angleUnit] Math.PI * 2

        radius = params.radius ?= radius
        height = params.height ?= height

        radialSegments = params.radialSegments ?= 8
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        radius = adaptor "invert", "length", radius
        height = adaptor "invert", "length", height

        thetaStart = convert.angle[angleUnit]["radian"] thetaStart
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        super radius, height, 8, heightSegments, openEnded, thetaStart, thetaLength
