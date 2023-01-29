class Heptagon extends Mesh

    constructor: (params = {}) ->

        super "heptagon", params

class POLY.HeptagonMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new HeptagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "heptagon"
        this.name = "Heptagon"

        return this
