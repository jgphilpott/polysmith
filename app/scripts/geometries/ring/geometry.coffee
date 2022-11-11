# Link: https://threejs.org/docs/#api/en/geometries/RingGeometry

class RingGeometry extends Geometry

    constructor : (innerRadius = 5, outerRadius = 10, thetaSegments = 42, phiSegments = 1, thetaStart = 0, thetaLength = Math.PI * 2) ->

        super "ring",

            innerRadius: innerRadius
            outerRadius: outerRadius

            thetaSegments: thetaSegments
            phiSegments: phiSegments

            thetaStart: thetaStart
            thetaLength: thetaLength

class POLY.RingBufferGeometry extends THREE.RingBufferGeometry

    constructor : (params) ->

        innerRadius = if "innerRadius" of params then params.innerRadius else 5
        outerRadius = if "outerRadius" of params then params.outerRadius else 10

        thetaSegments = if "thetaSegments" of params then params.thetaSegments else 42
        phiSegments = if "phiSegments" of params then params.phiSegments else 1

        thetaStart = if "thetaStart" of params then params.thetaStart else 0
        thetaLength = if "thetaLength" of params then params.thetaLength else Math.PI * 2

        super innerRadius, outerRadius, thetaSegments, phiSegments, thetaStart, thetaLength
