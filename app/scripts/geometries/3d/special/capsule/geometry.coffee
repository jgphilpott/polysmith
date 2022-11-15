# Link: https://threejs.org/docs/#api/en/geometries/CapsuleGeometry

class CapsuleGeometry extends Geometry

    constructor : (radius = 5, length = 5, radialSegments = 42, capSegments = 42) ->

        super "capsule",

            radius: radius
            length: length

            radialSegments: radialSegments
            capSegments: capSegments

class POLY.CapsuleBufferGeometry extends THREE.LatheBufferGeometry

    constructor : (params) ->

        path = new THREE.Path()

        radius = if "radius" of params then params.radius else 5
        length = if "length" of params then params.length else 5

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        capSegments = if "capSegments" of params then params.capSegments else 42

        path.absarc 0, -length / 2, radius, Math.PI * 1.5, 0
        path.absarc 0, length / 2, radius, 0, Math.PI * 0.5

        path = path.getPoints capSegments

        super path, radialSegments

        this.type = "CapsuleBufferGeometry"

        this.parameters =

            radius: radius
            length: length

            radialSegments: radialSegments
            capSegments: capSegments
