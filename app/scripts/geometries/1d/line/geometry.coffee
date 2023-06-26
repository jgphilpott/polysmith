# Link: https://threejs.org/docs/#api/en/objects/Line

class LineGeometry extends Geometry

    constructor: (params = {}) ->

        super "line", params

class POLY.LineBufferGeometry

    constructor: (params = {}) ->

        points = []

        vertices = [[10, 10, 10], [-10, -10, -10]]

        for vertex in vertices

            vertex[0] = adaptor "convert", "length", vertex[0]
            vertex[1] = adaptor "convert", "length", vertex[1]
            vertex[2] = adaptor "convert", "length", vertex[2]

        vertices = params.vertices ?= vertices

        for vertex in vertices

            vertex[0] = adaptor "invert", "length", vertex[0]
            vertex[1] = adaptor "invert", "length", vertex[1]
            vertex[2] = adaptor "invert", "length", vertex[2]

            points.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        line = new THREE.BufferGeometry().setFromPoints points

        line.vertices = vertices

        return line
