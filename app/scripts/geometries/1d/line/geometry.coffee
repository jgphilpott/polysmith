# Link: https://threejs.org/docs/#api/en/objects/Line

class LineGeometry extends Geometry

    constructor: (params = {}) ->

        super "line", params

class POLY.LineBufferGeometry

    constructor: (params = {}) ->

        vertices = params.vertices ?= [[10, 10, 10], [-10, -10, -10]]

        points = []

        for vertex in vertices

            points.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

        return new THREE.BufferGeometry().setFromPoints points
