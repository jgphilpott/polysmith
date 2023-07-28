class Decagon extends Mesh

    constructor: (params = {}) ->

        super "decagon", params

class POLY.DecagonMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new DecagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "decagon"
        this.name = params.name ?= "Decagon"

        return this
