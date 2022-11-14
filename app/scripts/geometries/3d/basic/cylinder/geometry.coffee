# Link: https://threejs.org/docs/#api/en/geometries/CylinderGeometry

class CylinderGeometry extends Geometry

    constructor : (length = 10, positiveRadius = 5, negativeRadius = 5, radialSegments = 42, heightSegments = 1, openEnded = false, thetaStart = 0, thetaLength = Math.PI * 2) ->

        super "cylinder",

            length: length

            positiveRadius: positiveRadius
            negativeRadius: negativeRadius

            radialSegments: radialSegments
            heightSegments: heightSegments

            openEnded: openEnded

            thetaStart: thetaStart
            thetaLength: thetaLength

class POLY.CylinderBufferGeometry extends THREE.CylinderBufferGeometry

    constructor : (params) ->

        length = if "length" of params then params.length else 10

        positiveRadius = if "positiveRadius" of params then params.positiveRadius else 5
        negativeRadius = if "negativeRadius" of params then params.negativeRadius else 5

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        heightSegments = if "heightSegments" of params then params.heightSegments else 1

        openEnded = if "openEnded" of params then params.openEnded else false

        thetaStart = if "thetaStart" of params then params.thetaStart else 0
        thetaLength = if "thetaLength" of params then params.thetaLength else Math.PI * 2

        super positiveRadius, negativeRadius, length, radialSegments, heightSegments, openEnded, thetaStart, thetaLength
