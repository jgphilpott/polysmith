class Stroke extends Mesh

    constructor : (params = {}) ->

        super "stroke", params

class POLY.StrokeMesh extends LineThickMesh

    constructor : (params = {}) ->

        params.material ?= "stroke"

        geometry = new StrokeGeometry params
        material = new LineMaterial params.material, params

        super geometry, material

        this.computeLineDistances()

        this.class = "stroke"
        this.name = "Stroke"

        return this
