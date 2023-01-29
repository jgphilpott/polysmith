class Plane extends Mesh

    constructor: (params = {}) ->

        super "plane", params

class POLY.PlaneMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new PlaneGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "plane"
        this.name = "Plane"

        return this
