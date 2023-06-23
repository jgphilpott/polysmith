# Link: https://gist.github.com/jgphilpott/ec71d7abcf504f85e01ffe9e297a682c

class StrokeGeometry extends Geometry

    constructor: (params = {}) ->

        super "stroke", params

class POLY.StrokeBufferGeometry

    constructor: (params = {}) ->

        positions = []

        vertices = [[10, 10, 10], [-10, -10, -10]]

        for vertex in vertices

            vertex[0] = adaptor "convert", "length", vertex[0]
            vertex[1] = adaptor "convert", "length", vertex[1]
            vertex[2] = adaptor "convert", "length", vertex[2]

        vertices = params.vertices ?= vertices

        for vertex in vertices

            x = adaptor "invert", "length", vertex[0]
            y = adaptor "invert", "length", vertex[1]
            z = adaptor "invert", "length", vertex[2]

            positions.push x, y, z

        return new LineThickGeometry().setPositions positions
