class Tube extends Mesh

    constructor: (params = {}) ->

        super "tube", params

class POLY.TubeMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TubeGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "tube"
        this.name = "Tube"

        return this
