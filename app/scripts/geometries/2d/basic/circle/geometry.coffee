# Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

class CircleGeometry extends Geometry

    constructor : (params = {}) ->

        super "circle", params

class POLY.CircleBufferGeometry extends THREE.CircleBufferGeometry

    constructor : (params = {}) ->

        radius = params.radius ?= 10
        segments = params.segments ?= 42

        thetaStart = params.thetaStart ?= 0
        thetaLength = params.thetaLength ?= Math.PI * 2

        super radius, segments, thetaStart, thetaLength
