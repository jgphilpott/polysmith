# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class DecagonalPyramidGeometry extends Geometry

    constructor: (params = {}) ->

        super "decagonal-pyramid", params

class POLY.DecagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 10
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 10, heightSegments, openEnded, thetaStart, thetaLength
