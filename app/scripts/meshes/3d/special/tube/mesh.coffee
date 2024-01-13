class Tube extends Mesh

    constructor: (params = {}) ->

        super "tube", params

class POLY.TubeMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TubeGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "tube"
        this.name = params.name ?= "Tube"

    getClosed: ->

        return clone this.params.closed

    setClosed: (closed, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.closed = Boolean closed
            this.geometry = new TubeGeometry this.params

            if save then this.save "update"

        return this

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new TubeGeometry this.params

            if save then this.save "update"

        return this

    getVertices: ->

        return clone this.params.vertices

    setVertices: (vertices, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.vertices = Array.from vertices
            this.geometry = new TubeGeometry this.params

            if save then this.save "update"

        return this

    getRadialSegments: ->

        return clone this.params.radialSegments

    setRadialSegments: (radialSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radialSegments = Number radialSegments
            this.geometry = new TubeGeometry this.params

            if save then this.save "update"

        return this

    getTubularSegments: ->

        return clone this.params.tubularSegments

    setTubularSegments: (tubularSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.tubularSegments = Number tubularSegments
            this.geometry = new TubeGeometry this.params

            if save then this.save "update"

        return this
