class TriangleGeometry extends Geometry

    constructor : (vertices = [
        [0, 0, 10 * Math.sqrt(3) / 4],
        [0, -5, -10 * Math.sqrt(3) / 4],
        [0, 5, -10 * Math.sqrt(3) / 4]
    ]) ->

        super "triangle",

            vertices: vertices

class POLY.TriangleBufferGeometry

    constructor : (params) ->

        geometry = new THREE.Geometry()

        if "vertices" of params

            vertices = params.vertices

        else

            vertices = [
                [0, 0, 10 * Math.sqrt(3) / 4],
                [0, -5, -10 * Math.sqrt(3) / 4],
                [0, 5, -10 * Math.sqrt(3) / 4]
            ]

        for vertex in vertices

            geometry.vertices.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        geometry.faces.push new THREE.Face3 0, 1, 2

        geometry.computeFaceNormals()

        return new THREE.BufferGeometry().fromGeometry geometry
