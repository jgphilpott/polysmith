class OctagonalPyramid extends Mesh

    constructor: (params = {}) ->

        super "octagonal-pyramid", params

class POLY.OctagonalPyramidMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new OctagonalPyramidGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "octagonal-pyramid"
        this.name = params.name ?= "Octagonal Pyramid"

        this.rotation.x = deg$rad 90

        return this
