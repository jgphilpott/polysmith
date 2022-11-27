# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class OctagonalPyramidGeometry extends Geometry

    constructor : (params = {}) ->

        super "octagonal-pyramid", params

class POLY.OctagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 8
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 8, heightSegments, openEnded, thetaStart, thetaLength
