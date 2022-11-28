class HexagonalPrism extends Mesh

    constructor : (params = {}) ->

        super "hexagonal-prism", params

class POLY.HexagonalPrismMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new HexagonalPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "hexagonal-prism"
        this.name = "Hexagonal Prism"

        return this
