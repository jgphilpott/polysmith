# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class RectangularPyramidGeometry extends Geometry

    constructor: (params = {}) ->

        super "rectangular-pyramid", params

class POLY.RectangularPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 4
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 4, heightSegments, openEnded, thetaStart, thetaLength
