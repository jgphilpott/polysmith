class RectangularPyramid extends Mesh

    constructor: (params = {}) ->

        super "rectangular-pyramid", params

class POLY.RectangularPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new RectangularPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "rectangular-pyramid"
        this.name = params.name ?= "Rectangular Pyramid"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this
