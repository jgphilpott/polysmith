class QuadrilateralGeometry extends Geometry

    constructor : (params = {}) ->

        super "quadrilateral", params

class POLY.QuadrilateralBufferGeometry

    constructor : (params = {}) ->

        geometry = new THREE.Geometry()

        vertices = params.vertices ?= [
            [0, 5, 5],
            [0, -5, 5],
            [0, -5, -5],
            [0, 5, -5]
        ]

        for vertex in vertices

            geometry.vertices.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        geometry.faces.push new THREE.Face3 0, 1, 2
        geometry.faces.push new THREE.Face3 2, 3, 0

        geometry.computeFaceNormals()

        return new THREE.BufferGeometry().fromGeometry geometry
