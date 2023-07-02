class DecagonGeometry extends Geometry

    constructor: (params = {}) ->

        super "decagon", params

class POLY.DecagonBufferGeometry

    constructor: (params = {}) ->

        size = 10
        vertices = []
        angle = 360 / size
        radius = params.radius ?= adaptor "convert", "length", 5

        for index in [0...size]

            point = circumpoint angle * index, radius

            vertices.push [point[0], point[1], 0]

        vertices = params.vertices ?= vertices

        geometry = new THREE.Geometry()

        for vertex in vertices

            vertex[0] = adaptor "invert", "length", vertex[0]
            vertex[1] = adaptor "invert", "length", vertex[1]
            vertex[2] = adaptor "invert", "length", vertex[2]

            geometry.vertices.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        for index in [1...size - 1]

            geometry.faces.push new THREE.Face3 0, index, index + 1

        geometry.computeFaceNormals()

        return new THREE.BufferGeometry().fromGeometry geometry
