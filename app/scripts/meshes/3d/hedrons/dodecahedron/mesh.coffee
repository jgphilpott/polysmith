class Dodecahedron extends Mesh

    constructor: (params = {}) ->

        super "dodecahedron", params

class POLY.DodecahedronMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new DodecahedronGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "dodecahedron"
        this.name = "Dodecahedron"

        return this
