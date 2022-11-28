class HeptagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "heptagonal-pyramid", params

class POLY.HeptagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new HeptagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "heptagonal-pyramid"
        this.name = "Heptagonal Pyramid"

        return this
