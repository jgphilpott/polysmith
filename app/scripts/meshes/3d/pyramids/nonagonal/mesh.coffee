class NonagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "nonagonal-pyramid", params

class POLY.NonagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new NonagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.x = deg$rad 90

        this.class = "nonagonal-pyramid"
        this.name = "Nonagonal Pyramid"

        return this
