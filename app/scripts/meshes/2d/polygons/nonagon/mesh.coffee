class Nonagon extends Mesh

    constructor: (params = {}) ->

        super "nonagon", params

class POLY.NonagonMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new NonagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "nonagon"
        this.name = params.name ?= "Nonagon"

        return this
