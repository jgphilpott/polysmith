class Torus extends Mesh

    constructor: (params = {}) ->

        super "torus", params

class POLY.TorusMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TorusGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.y = deg$rad 90

        this.class = "torus"
        this.name = "Torus"

        return this
