# Link: https://threejs.org/docs/#api/en/geometries/CircleGeometry

class CircleGeometry extends Geometry

    constructor : (radius = 10, segments = 42, thetaStart = 0, thetaLength = Math.PI * 2) ->

        super "circle",

            radius: radius
            segments: segments

            thetaStart: thetaStart
            thetaLength: thetaLength

class POLY.CircleBufferGeometry extends THREE.CircleBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 10
        segments = if "segments" of params then params.segments else 42

        thetaStart = if "thetaStart" of params then params.thetaStart else 0
        thetaLength = if "thetaLength" of params then params.thetaLength else Math.PI * 2

        super radius, segments, thetaStart, thetaLength
