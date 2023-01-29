class Circle extends Mesh

    constructor: (params = {}) ->

        super "circle", params

class POLY.CircleMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new CircleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "circle"
        this.name = "Circle"

        return this
