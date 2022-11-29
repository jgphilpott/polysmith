class RectangularPyramid extends Mesh

    constructor : (params = {}) ->

        super "rectangular-pyramid", params

class POLY.RectangularPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new RectangularPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.x = deg$rad 90

        this.class = "rectangular-pyramid"
        this.name = "Rectangular Pyramid"

        return this
