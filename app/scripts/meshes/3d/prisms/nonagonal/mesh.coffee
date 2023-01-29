class NonagonalPrism extends Mesh

    constructor: (params = {}) ->

        super "nonagonal-prism", params

class POLY.NonagonalPrismMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new NonagonalPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "nonagonal-prism"
        this.name = "Nonagonal Prism"

        return this
