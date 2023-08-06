class DecagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "decagonal-pyramid", params

class POLY.DecagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new DecagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "decagonal-pyramid"
        this.name = params.name ?= "Decagonal Pyramid"

        this.rotation.x = deg$rad 90

        return this
