class TriangularPyramid extends Mesh

    constructor : (params = {}) ->

        super "triangular-pyramid", params

class POLY.TriangularPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new TriangularPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "triangular-pyramid"
        this.name = "Triangular Pyramid"

        return this
