# Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

class CylindricalPrismGeometry extends Geometry

    constructor: (params = {}) ->

        super "cylindrical-prism", params

class POLY.CylindricalPrismBufferGeometry extends THREE.CylinderBufferGeometry

    constructor: (params = {}) ->

        length = adaptor "convert", "length", 10

        positiveRadius = adaptor "convert", "length", 5
        negativeRadius = adaptor "convert", "length", 5

        angleUnit = settings.get "scales.angle.unit"
        thetaLength = convert.angle["radian"][angleUnit] Math.PI * 2

        length = params.length ?= length

        positiveRadius = params.positiveRadius ?= positiveRadius
        negativeRadius = params.negativeRadius ?= negativeRadius

        radialSegments = params.radialSegments ?= 42
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= thetaLength

        length = adaptor "invert", "length", length

        positiveRadius = adaptor "invert", "length", positiveRadius
        negativeRadius = adaptor "invert", "length", negativeRadius

        thetaStart = convert.angle[angleUnit]["radian"] thetaStart
        thetaLength = convert.angle[angleUnit]["radian"] thetaLength

        super positiveRadius, negativeRadius, length, radialSegments, heightSegments, openEnded, thetaStart, thetaLength
