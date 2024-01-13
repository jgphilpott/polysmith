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

        return this

    getLength: ->

        return clone this.params.length

    setLength: (length, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.length = Number length
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

        return this

    getWidthSegments: ->

        return clone this.params.widthSegments

    setWidthSegments: (widthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.widthSegments = Number widthSegments
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

        return this

    getLengthSegments: ->

        return clone this.params.lengthSegments

    setLengthSegments: (lengthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.lengthSegments = Number lengthSegments
            this.geometry = new PlaneGeometry this.params

            if save then this.save "update"

        return this
