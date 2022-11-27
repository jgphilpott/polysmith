# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class HeptagonalPyramidGeometry extends Geometry

    constructor : (params = {}) ->

        super "heptagonal-pyramid", params

class POLY.HeptagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 7
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 7, heightSegments, openEnded, thetaStart, thetaLength
