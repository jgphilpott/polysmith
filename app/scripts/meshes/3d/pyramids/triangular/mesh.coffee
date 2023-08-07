class TriangularPyramid extends Mesh

    constructor: (params = {}) ->

        super "triangular-pyramid", params

class POLY.TriangularPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TriangularPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "triangular-pyramid"
        this.name = params.name ?= "Triangular Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
