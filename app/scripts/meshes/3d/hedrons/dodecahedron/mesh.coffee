class Dodecahedron extends Mesh

    constructor: (params = {}) ->

        super "dodecahedron", params

class POLY.DodecahedronMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new DodecahedronGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "dodecahedron"
        this.name = params.name ?= "Dodecahedron"

        return this
