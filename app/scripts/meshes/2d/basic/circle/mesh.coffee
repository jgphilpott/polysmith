class Circle extends Mesh

    constructor: (params = {}) ->

        super "circle", params

class POLY.CircleMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new CircleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "circle"
        this.name = params.name ?= "Circle"

        return this

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new CircleGeometry this.params

            if save then this.save "update"

        return this

    getSegments: ->

        return clone this.params.segments

    setSegments: (segments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.segments = Number segments
            this.geometry = new CircleGeometry this.params

            if save then this.save "update"

        return this

    getThetaStart: ->

        return clone this.params.thetaStart

    setThetaStart: (thetaStart, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaStart = Number thetaStart
            this.geometry = new CircleGeometry this.params

            if save then this.save "update"

        return this

    getThetaLength: ->

        return clone this.params.thetaLength

    setThetaLength: (thetaLength, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaLength = Number thetaLength
            this.geometry = new CircleGeometry this.params

            if save then this.save "update"

        return this
