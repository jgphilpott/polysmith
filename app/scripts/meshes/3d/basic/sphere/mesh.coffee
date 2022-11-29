class Sphere extends Mesh

    constructor : (params = {}) ->

        super "sphere", params

class POLY.SphereMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new SphereGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.rotation.x = deg$rad 90

        this.class = "sphere"
        this.name = "Sphere"

        return this
