class StrokeGeometry extends Geometry

    constructor : (vertices = [[10, 10, 10], [-10, -10, -10]]) ->

        super "stroke",

            vertices: vertices

class POLY.StrokeBufferGeometry

    constructor : (params) ->

        vertices = if "vertices" of params then params.vertices else [[10, 10, 10], [-10, -10, -10]]

        positions = []

        for vertex in vertices

            positions.push vertex[0], vertex[1], vertex[2]

        return new LineThickGeometry().setPositions positions
