class HeptagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "heptagonal-pyramid", params

class POLY.HeptagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new HeptagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "heptagonal-pyramid"
        this.name = params.name ?= "Heptagonal Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
