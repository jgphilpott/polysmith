class HexagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "hexagonal-pyramid", params

class POLY.HexagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new HexagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "hexagonal-pyramid"
        this.name = "Hexagonal Pyramid"

        return this
