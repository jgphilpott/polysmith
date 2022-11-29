class DecagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "decagonal-pyramid", params

class POLY.DecagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new DecagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.x = deg$rad 90

        this.class = "decagonal-pyramid"
        this.name = "Decagonal Pyramid"

        return this
