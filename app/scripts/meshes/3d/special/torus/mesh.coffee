class Torus extends Mesh

    constructor: (params = {}) ->

        super "torus", params

class POLY.TorusMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new TorusGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "torus"
        this.name = params.name ?= "Torus"

        return this

    getArc: ->

        return clone this.params.arc

    setArc: (arc, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.arc = Number arc
            this.geometry = new TorusGeometry this.params

            if save then this.save "update"

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new TorusGeometry this.params

            if save then this.save "update"

    getThickness: ->

        return clone this.params.thickness

    setThickness: (thickness, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thickness = Number thickness
            this.geometry = new TorusGeometry this.params

            if save then this.save "update"

    getRadialSegments: ->

        return clone this.params.radialSegments

    setRadialSegments: (radialSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radialSegments = Number radialSegments
            this.geometry = new TorusGeometry this.params

            if save then this.save "update"

    getTubularSegments: ->

        return clone this.params.tubularSegments

    setTubularSegments: (tubularSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.tubularSegments = Number tubularSegments
            this.geometry = new TorusGeometry this.params

            if save then this.save "update"
