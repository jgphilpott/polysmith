# Link: https://threejs.org/docs/#api/en/geometries/TorusGeometry

class TorusGeometry extends Geometry

    constructor : (radius = 5, thickness = 1, radialSegments = 42, tubularSegments = 42, arc = Math.PI * 2) ->

        super "torus",

            radius: radius
            thickness: thickness

            radialSegments: radialSegments
            tubularSegments: tubularSegments

            arc: arc

class POLY.TorusBufferGeometry extends THREE.TorusBufferGeometry

    constructor : (params) ->

        radius = if "radius" of params then params.radius else 5
        thickness = if "thickness" of params then params.thickness else 1

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        tubularSegments = if "tubularSegments" of params then params.tubularSegments else 42

        arc = if "arc" of params then params.arc else Math.PI * 2

        super radius, thickness, radialSegments, tubularSegments, arc
