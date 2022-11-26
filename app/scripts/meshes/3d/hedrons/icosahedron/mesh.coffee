class Icosahedron extends Mesh

    constructor : (params = {}) ->

        super "icosahedron", params

class POLY.IcosahedronMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new IcosahedronGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "icosahedron"
        this.name = "Icosahedron"

        return this
