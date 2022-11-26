class Knot extends Mesh

    constructor : (params = {}) ->

        super "knot", params

class POLY.KnotMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new KnotGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "knot"
        this.name = "Knot"

        return this
