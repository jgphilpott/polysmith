class PentagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "pentagonal-pyramid", params

class POLY.PentagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new PentagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "pentagonal-pyramid"
        this.name = "Pentagonal Pyramid"

        return this
