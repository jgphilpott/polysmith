class Knot extends Mesh

    constructor: (params = {}) ->

        super "knot", params

class POLY.KnotMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new KnotGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "knot"
        this.name = params.name ?= "Knot"

        return this

    getP: ->

        return clone this.params.p

    setP: (p, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.p = Number p
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"

    getQ: ->

        return clone this.params.q

    setQ: (q, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.q = Number q
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"

    getThickness: ->

        return clone this.params.thickness

    setThickness: (thickness, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thickness = Number thickness
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"

    getRadialSegments: ->

        return clone this.params.radialSegments

    setRadialSegments: (radialSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radialSegments = Number radialSegments
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"

    getTubularSegments: ->

        return clone this.params.tubularSegments

    setTubularSegments: (tubularSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.tubularSegments = Number tubularSegments
            this.geometry = new KnotGeometry this.params

            if save then this.save "update"
