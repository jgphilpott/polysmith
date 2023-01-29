class Box extends Mesh

    constructor: (params = {}) ->

        super "box", params

class POLY.BoxMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new BoxGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "box"
        this.name = "Box"

        return this
