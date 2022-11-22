# Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

class SphereGeometry extends Geometry

    constructor : (params = {}) ->

        super "sphere", params

class POLY.SphereBufferGeometry extends THREE.SphereBufferGeometry

    constructor : (params) ->

        radius = params.radius ?= 5

        widthSegments = params.widthSegments ?= 42
        heightSegments = params.heightSegments ?= 42

        phiStart = params.phiStart ?= 0
        phiLength = params.phiLength ?= Math.PI * 2

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI

        super radius, widthSegments, heightSegments, phiStart, phiLength, thetaStart, thetaLength
