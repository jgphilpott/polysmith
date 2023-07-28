class Octagon extends Mesh

    constructor: (params = {}) ->

        super "octagon", params

class POLY.OctagonMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new OctagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "octagon"
        this.name = params.name ?= "Octagon"

        return this
