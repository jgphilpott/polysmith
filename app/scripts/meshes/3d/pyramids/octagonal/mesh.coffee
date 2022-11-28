class OctagonalPyramid extends Mesh

    constructor : (params = {}) ->

        super "octagonal-pyramid", params

class POLY.OctagonalPyramidMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new OctagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "octagonal-pyramid"
        this.name = "Octagonal Pyramid"

        return this
