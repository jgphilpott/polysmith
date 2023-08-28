# Link: https://threejs.org/docs/#api/en/geometries/TubeGeometry

class TubeGeometry extends Geometry

    constructor: (params = {}) ->

        super "tube", params

class POLY.TubeBufferGeometry extends THREE.TubeBufferGeometry

    constructor: (params = {}) ->

        tube = []

        radius = adaptor "convert", "length", 1
        vertices = [[10, 10, 10], [-10, -10, -10]]

        for vertex in vertices

            vertex[0] = adaptor "convert", "length", vertex[0]
            vertex[1] = adaptor "convert", "length", vertex[1]
            vertex[2] = adaptor "convert", "length", vertex[2]

        closed = params.closed ?= false

        radius = params.radius ?= radius
        vertices = params.vertices ?= vertices

        radialSegments = params.radialSegments ?= 42
        tubularSegments = params.tubularSegments ?= 42

        radius = adaptor "invert", "length", radius

        for vertex in vertices

            vertex[0] = adaptor "invert", "length", vertex[0]
            vertex[1] = adaptor "invert", "length", vertex[1]
            vertex[2] = adaptor "invert", "length", vertex[2]

            tube.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        tube = new THREE.CatmullRomCurve3 tube

        super tube, tubularSegments, radius, radialSegments, closed
