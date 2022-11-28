class PentagonalPrism extends Mesh

    constructor : (params = {}) ->

        super "pentagonal-prism", params

class POLY.PentagonalPrismMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new PentagonalPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "pentagonal-prism"
        this.name = "Pentagonal Prism"

        return this
