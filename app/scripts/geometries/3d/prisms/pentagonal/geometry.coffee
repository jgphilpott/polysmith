# Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

class PentagonalPrismGeometry extends Geometry

    constructor: (params = {}) ->

        super "pentagonal-prism", params

class POLY.PentagonalPrismBufferGeometry extends THREE.CylinderBufferGeometry

    constructor: (params = {}) ->

        length = params.length ?= 10

        positiveRadius = params.positiveRadius ?= 5
        negativeRadius = params.negativeRadius ?= 5

        radialSegments = params.radialSegments ?= 5
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super positiveRadius, negativeRadius, length, 5, heightSegments, openEnded, thetaStart, thetaLength
