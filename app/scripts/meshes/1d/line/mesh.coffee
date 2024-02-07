class Line extends Mesh

    constructor: (params = {}) ->

        super "line", params

class POLY.LineMesh extends THREE.Line

    constructor: (params = {}) ->

        material = params.material ?= "solid"

        geometry = new LineGeometry params
        material = new LineMaterial material, params

        super geometry, material

        this.class = params.class ?= "line"
        this.name = params.name ?= "Line"

        this.computeLineDistances()

        return this
