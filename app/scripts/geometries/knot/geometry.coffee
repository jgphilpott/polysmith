# Link: https://threejs.org/docs/#api/en/geometries/TorusKnotGeometry

class TorusKnotGeometry extends Geometry

    constructor : (radius = 10, thickness = 3, radialSegments = 42, tubularSegments = 42, p = 2, q = 3) ->

        super "knot",

            radius: radius
            thickness: thickness

            radialSegments: radialSegments
            tubularSegments: tubularSegments

            p: p
            q: q

class POLY.TorusKnotBufferGeometry extends THREE.TorusKnotBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 10
        thickness = if "thickness" of params then params.thickness else 3

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        tubularSegments = if "tubularSegments" of params then params.tubularSegments else 42

        p = if "p" of params then params.p else 2
        q = if "q" of params then params.q else 3

        super radius, thickness, tubularSegments, radialSegments, p, q
