class Stroke extends Mesh

    constructor: (params = {}) ->

        super "stroke", params

class POLY.StrokeMesh extends LineThickMesh

    constructor: (params = {}) ->

        material = params.material ?= "stroke"

        geometry = new StrokeGeometry params
        material = new LineMaterial material, params

        super geometry, material

        this.class = params.class ?= "stroke"
        this.name = params.name ?= "Stroke"

        this.computeLineDistances()

        return this
