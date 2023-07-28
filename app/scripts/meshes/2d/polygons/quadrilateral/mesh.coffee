class Quadrilateral extends Mesh

    constructor: (params = {}) ->

        super "quadrilateral", params

class POLY.QuadrilateralMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new QuadrilateralGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "quadrilateral"
        this.name = params.name ?= "Quadrilateral"

        return this
