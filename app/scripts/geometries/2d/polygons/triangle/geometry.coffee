class TriangleGeometry extends Geometry

    constructor : (params = {}) ->

        super "triangle", params

class POLY.TriangleBufferGeometry

    constructor : (params = {}) ->

        angle = 360 / 3
        radius = params.radius ?= 5

        geometry = new THREE.Geometry()

        p0 = circumpoint angle * 0, radius
        p1 = circumpoint angle * 1, radius
        p2 = circumpoint angle * 2, radius

        vertices = params.vertices ?= [
            [0, p0[0], p0[1]]
            [0, p1[0], p1[1]]
            [0, p2[0], p2[1]]
        ]

        for vertex in vertices

            geometry.vertices.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        geometry.faces.push new THREE.Face3 0, 1, 2

        geometry.computeFaceNormals()

        return new THREE.BufferGeometry().fromGeometry geometry
