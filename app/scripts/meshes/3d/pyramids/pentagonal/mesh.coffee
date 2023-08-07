class PentagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "pentagonal-pyramid", params

class POLY.PentagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new PentagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "pentagonal-pyramid"
        this.name = params.name ?= "Pentagonal Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
