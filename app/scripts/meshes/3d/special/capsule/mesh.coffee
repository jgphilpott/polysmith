class Capsule extends Mesh

    constructor : (params = {}) ->

        super "capsule", params

class POLY.CapsuleMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new CapsuleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "capsule"
        this.name = "Capsule"

        return this
