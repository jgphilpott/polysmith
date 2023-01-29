# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class PentagonalPyramidGeometry extends Geometry

    constructor: (params = {}) ->

        super "pentagonal-pyramid", params

class POLY.PentagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 5
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 5, heightSegments, openEnded, thetaStart, thetaLength
