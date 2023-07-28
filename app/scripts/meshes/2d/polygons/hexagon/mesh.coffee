class Hexagon extends Mesh

    constructor: (params = {}) ->

        super "hexagon", params

class POLY.HexagonMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new HexagonGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "hexagon"
        this.name = params.name ?= "Hexagon"

        return this
