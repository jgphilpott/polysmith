# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

class ConeGeometry extends Geometry

    constructor : (radius = 5, height = 10, radialSegments = 42, heightSegments = 1, openEnded = false, thetaStart = 0, thetaLength = Math.PI * 2) ->

        super "cone",

            radius: radius
            height: height

            radialSegments: radialSegments
            heightSegments: heightSegments

            openEnded: openEnded

            thetaStart: thetaStart
            thetaLength: thetaLength

class POLY.ConeBufferGeometry extends THREE.ConeBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5
        height = if "height" of params then params.height else 10

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        heightSegments = if "heightSegments" of params then params.heightSegments else 1

        openEnded = if "openEnded" of params then params.openEnded else false

        thetaStart = if "thetaStart" of params then params.thetaStart else 0
        thetaLength = if "thetaLength" of params then params.thetaLength else Math.PI * 2

        super radius, height, radialSegments, heightSegments, openEnded, thetaStart, thetaLength
