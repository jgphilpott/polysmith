# Link: https://threejs.org/docs/#api/en/geometries/RingGeometry

class RingGeometry extends Geometry

    constructor : (params = {}) ->

        super "ring", params

class POLY.RingBufferGeometry extends THREE.RingBufferGeometry

    constructor : (params) ->

        innerRadius = params.innerRadius ?= 5
        outerRadius = params.outerRadius ?= 10

        thetaSegments = params.thetaSegments ?= 42
        phiSegments = params.phiSegments ?= 1

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super innerRadius, outerRadius, thetaSegments, phiSegments, thetaStart, thetaLength
