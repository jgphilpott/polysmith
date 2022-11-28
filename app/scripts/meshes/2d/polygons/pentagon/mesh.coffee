class Pentagon extends Mesh

    constructor : (params = {}) ->

        super "pentagon", params

class POLY.PentagonMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new PentagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "pentagon"
        this.name = "Pentagon"

        return this
