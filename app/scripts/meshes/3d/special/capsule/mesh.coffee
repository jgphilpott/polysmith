class Capsule extends Mesh

    constructor: (params = {}) ->

        super "capsule", params

class POLY.CapsuleMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new CapsuleGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "capsule"
        this.name = params.name ?= "Capsule"

        return this

    getLength: ->

        return clone this.params.length

    setLength: (length, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.length = Number length
            this.geometry = new CapsuleGeometry this.params

            if save then this.save "update"

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new CapsuleGeometry this.params

            if save then this.save "update"

    getCapSegments: ->

        return clone this.params.capSegments

    setCapSegments: (capSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.capSegments = Number capSegments
            this.geometry = new CapsuleGeometry this.params

            if save then this.save "update"

    getRadialSegments: ->

        return clone this.params.radialSegments

    setRadialSegments: (radialSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radialSegments = Number radialSegments
            this.geometry = new CapsuleGeometry this.params

            if save then this.save "update"
