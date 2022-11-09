# Link: https://threejs.org/docs/#api/en/geometries/TubeGeometry

class TubeGeometry extends Geometry

    constructor : (vertices = [[10, 10, 10], [-10, -10, -10]], radius = 1, radialSegments = 42, tubularSegments = 42, closed = false) ->

        super "tube",

            vertices: vertices

            radius: radius

            radialSegments: radialSegments
            tubularSegments: tubularSegments

            closed: closed

class POLY.TubeBufferGeometry extends THREE.TubeBufferGeometry

    constructor : (params) ->

        path = []

        vertices = if "vertices" of params then params.vertices else [[10, 10, 10], [-10, -10, -10]]

        radius = if "radius" of params then params.radius else 1

        radialSegments = if "radialSegments" of params then params.radialSegments else 42
        tubularSegments = if "tubularSegments" of params then params.tubularSegments else 42

        closed = if "closed" of params then params.closed else false

        for vertex in vertices

            path.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        path = new THREE.CatmullRomCurve3 path

        super path, tubularSegments, radius, radialSegments, closed
