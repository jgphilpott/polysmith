class Plane extends Mesh

    constructor: (params = {}) ->

        super "plane", params

class POLY.PlaneMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new PlaneGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "plane"
        this.name = params.name ?= "Plane"

        return this

    getWidth: ->

        return clone this.params.width

    setWidth: (width, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.width = Number width
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

    getHeight: ->

        return clone this.params.height

    setHeight: (height, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.height = Number height
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

    getWidthSegments: ->

        return clone this.params.widthSegments

    setWidthSegments: (widthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.widthSegments = Number widthSegments
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

    getHeightSegments: ->

        return clone this.params.heightSegments

    setHeightSegments: (heightSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.heightSegments = Number heightSegments
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"
