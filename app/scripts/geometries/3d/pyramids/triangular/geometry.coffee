# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class TriangularPyramidGeometry extends Geometry

    constructor: (params = {}) ->

        super "triangular-pyramid", params

class POLY.TriangularPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 3
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 3, heightSegments, openEnded, thetaStart, thetaLength
