# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class HexagonalPyramidGeometry extends Geometry

    constructor : (params = {}) ->

        super "hexagonal-pyramid", params

class POLY.HexagonalPyramidBufferGeometry extends THREE.ConeBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 6
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, 6, heightSegments, openEnded, thetaStart, thetaLength
