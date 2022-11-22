class StrokeGeometry extends Geometry

    constructor : (params = {}) ->

        super "stroke", params

class POLY.StrokeBufferGeometry

    constructor : (params) ->

        vertices = params.vertices ?= [[10, 10, 10], [-10, -10, -10]]

        positions = []

        for vertex in vertices

            positions.push vertex[0], vertex[1], vertex[2]

        return new LineThickGeometry().setPositions positions
