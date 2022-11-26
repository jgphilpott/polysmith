class Octahedron extends Mesh

    constructor : (params = {}) ->

        super "octahedron", params

class POLY.OctahedronMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new OctahedronGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "octahedron"
        this.name = "Octahedron"

        return this
