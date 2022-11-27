class Triangle extends Mesh

    constructor : (params = {}) ->

        super "triangle", params

class POLY.TriangleMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new TriangleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "triangle"
        this.name = "Triangle"

        return this
