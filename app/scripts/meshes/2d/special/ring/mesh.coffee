class Ring extends Mesh

    constructor: (params = {}) ->

        super "ring", params

class POLY.RingMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new RingGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "ring"
        this.name = "Ring"

        return this
