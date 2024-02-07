class Triangle extends Mesh

    constructor: (params = {}) ->

        super "triangle", params

class POLY.TriangleMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TriangleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "triangle"
        this.name = params.name ?= "Triangle"

        return this
