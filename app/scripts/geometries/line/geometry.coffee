# Link: https://threejs.org/docs/#api/en/objects/Line

class LineGeometry extends Geometry

    constructor : (vertices = [[10, 10, 10], [-10, -10, -10]]) ->

        super "line",

            vertices: vertices

class POLY.LineBufferGeometry

    constructor : (params) ->

        vertices = if "vertices" of params then params.vertices else [[10, 10, 10], [-10, -10, -10]]

        points = []

        for vertex in vertices

            points.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        return new THREE.BufferGeometry().setFromPoints points
