class Cone extends Mesh

    constructor : (params = {}) ->

        super "cone", params

class POLY.ConeMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new ConeGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.x = deg$rad 90

        this.class = "cone"
        this.name = "Cone"

        return this
