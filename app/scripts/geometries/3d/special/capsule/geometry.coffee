# Link: https://threejs.org/docs/#api/en/geometries/CapsuleGeometry

class CapsuleGeometry extends Geometry

    constructor: (params = {}) ->

        super "capsule", params

class POLY.CapsuleBufferGeometry extends THREE.LatheBufferGeometry

    constructor: (params = {}) ->

        path = new THREE.Path()

        length = adaptor "convert", "length", 5
        radius = adaptor "convert", "length", 5

        length = params.length ?= length
        radius = params.radius ?= radius

        capSegments = params.capSegments ?= 42
        radialSegments = params.radialSegments ?= 42

        length = adaptor "invert", "length", length
        radius = adaptor "invert", "length", radius

        path.absarc 0, -length / 2, radius, Math.PI * 1.5, 0
        path.absarc 0, length / 2, radius, 0, Math.PI * 0.5

        path = path.getPoints capSegments

        super path, radialSegments

        this.type = "CapsuleBufferGeometry"
