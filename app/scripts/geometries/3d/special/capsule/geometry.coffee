# Link: https://threejs.org/docs/#api/en/geometries/CapsuleGeometry

class CapsuleGeometry extends Geometry

    constructor: (params = {}) ->

        super "capsule", params

class POLY.CapsuleBufferGeometry extends THREE.LatheBufferGeometry

    constructor: (params = {}) ->

        path = new THREE.Path()

        radius = adaptor "convert", "length", 5
        length = adaptor "convert", "length", 5

        radius = params.radius ?= radius
        length = params.length ?= length

        capSegments = params.capSegments ?= 42
        radialSegments = params.radialSegments ?= 42

        radius = adaptor "invert", "length", radius
        length = adaptor "invert", "length", length

        path.absarc 0, -length / 2, radius, Math.PI * 1.5, 0
        path.absarc 0, length / 2, radius, 0, Math.PI * 0.5

        path = path.getPoints capSegments

        super path, radialSegments

        this.type = "CapsuleBufferGeometry"

        this.parameters =

            radius: radius
            length: length

            capSegments: capSegments
            radialSegments: radialSegments
