class Icosahedron extends Mesh

    constructor: (params = {}) ->

        super "icosahedron", params

class POLY.IcosahedronMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new IcosahedronGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "icosahedron"
        this.name = params.name ?= "Icosahedron"

        return this
