class CylindricalPrism extends Mesh

    constructor: (params = {}) ->

        super "cylindrical-prism", params

class POLY.CylindricalPrismMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new CylindricalPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "cylindrical-prism"
        this.name = params.name ?= "Cylindrical Prism"

        return this
