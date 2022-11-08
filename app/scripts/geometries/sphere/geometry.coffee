# Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

class SphereGeometry extends Geometry

    constructor : (radius = 5, widthSegments = 42, heightSegments = 42, phiStart = 0, phiLength = Math.PI * 2, thetaStart = 0, thetaLength = Math.PI) ->

        super "sphere",

            radius: radius

            widthSegments: widthSegments
            heightSegments: heightSegments

            phiStart: phiStart
            phiLength: phiLength

            thetaStart: thetaStart
            thetaLength: thetaLength

class POLY.SphereBufferGeometry extends THREE.SphereBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5

        widthSegments = if "widthSegments" of params then params.widthSegments else 42
        heightSegments = if "heightSegments" of params then params.heightSegments else 42

        phiStart = if "phiStart" of params then params.phiStart else 0
        phiLength = if "phiLength" of params then params.phiLength else Math.PI * 2

        thetaStart = if "thetaStart" of params then params.thetaStart else 0
        thetaLength = if "thetaLength" of params then params.thetaLength else Math.PI

        super radius, widthSegments, heightSegments, phiStart, phiLength, thetaStart, thetaLength
