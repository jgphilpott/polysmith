class RectangularPrism extends Mesh

    constructor: (params = {}) ->

        super "rectangular-prism", params

class POLY.RectangularPrismMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new RectangularPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "rectangular-prism"
        this.name = "Rectangular Prism"

        return this
