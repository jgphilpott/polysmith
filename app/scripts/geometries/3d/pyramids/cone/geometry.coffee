# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class ConeGeometry extends Geometry

    constructor: (params = {}) ->

        super "cone", params

class POLY.ConeBufferGeometry extends THREE.ConeBufferGeometry

    constructor: (params = {}) ->

        radius = params.radius ?= 5
        height = params.height ?= 10

        radialSegments = params.radialSegments ?= 42
        heightSegments = params.heightSegments ?= 1

        openEnded = params.openEnded ?= false

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, height, radialSegments, heightSegments, openEnded, thetaStart, thetaLength
