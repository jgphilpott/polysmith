class Cylinder extends Mesh

    constructor : (params = {}) ->

        super "cylinder", params

class POLY.CylinderMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new CylinderGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "cylinder"
        this.name = "Cylinder"

        return this
