class NonagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "nonagonal-pyramid", params

class POLY.NonagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new NonagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "nonagonal-pyramid"
        this.name = params.name ?= "Nonagonal Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
