# Link: https://threejs.org/docs/#api/en/geometries/TubeGeometry

class TubeGeometry extends Geometry

    constructor: (params = {}) ->

        super "tube", params

class POLY.TubeBufferGeometry extends THREE.TubeBufferGeometry

    constructor: (params = {}) ->

        path = []

        vertices = params.vertices ?= [[10, 10, 10], [-10, -10, -10]]

        radius = params.radius ?= 1

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        closed = params.closed ?= false

        for vertex in vertices

            path.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        path = new THREE.CatmullRomCurve3 path

        super path, tubularSegments, radius, radialSegments, closed
