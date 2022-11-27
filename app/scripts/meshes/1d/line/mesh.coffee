class Line extends Mesh

    constructor : (params = {}) ->

        super "line", params

class POLY.LineMesh extends THREE.Line

    constructor : (params = {}) ->

        params.material ?= "solid"

        geometry = new LineGeometry params
        material = new LineMaterial params.material, params

        super geometry, material

        this.computeLineDistances()

        this.class = "line"
        this.name = "Line"

        return this
