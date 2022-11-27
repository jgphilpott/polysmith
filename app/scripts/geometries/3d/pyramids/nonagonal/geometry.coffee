# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class NonagonalPyramidGeometry extends Geometry

    constructor : (params = {}) ->

        super "nonagonal-pyramid", params

class POLY.NonagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 9
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 9, heightSegments, openEnded, thetaStart, thetaLength
