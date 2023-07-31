class Box extends Mesh

    constructor: (params = {}) ->

        super "box", params

class POLY.BoxMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new BoxGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "box"
        this.name = params.name ?= "Box"

        return this

    getWidth: ->

        return clone this.params.width

    setWidth: (width, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.width = Number width
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"

    getLength: ->

        return clone this.params.length

    setLength: (length, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.length = Number length
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"

    getHeight: ->

        return clone this.params.height

    setHeight: (height, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.height = Number height
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"

    getWidthSegments: ->

        return clone this.params.widthSegments

    setWidthSegments: (widthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.widthSegments = Number widthSegments
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"

    getLengthSegments: ->

        return clone this.params.lengthSegments

    setLengthSegments: (lengthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.lengthSegments = Number lengthSegments
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"

    getHeightSegments: ->

        return clone this.params.heightSegments

    setHeightSegments: (heightSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.heightSegments = Number heightSegments
            this.geometry = new BoxGeometry this.params

            if save then this.save "update"
