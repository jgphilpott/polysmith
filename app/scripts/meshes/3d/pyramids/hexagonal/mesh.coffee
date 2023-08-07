class HexagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "hexagonal-pyramid", params

class POLY.HexagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new HexagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "hexagonal-pyramid"
        this.name = params.name ?= "Hexagonal Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
