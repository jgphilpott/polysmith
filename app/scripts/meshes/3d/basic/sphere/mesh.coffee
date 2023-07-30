class Sphere extends Mesh

    constructor: (params = {}) ->

        super "sphere", params

class POLY.SphereMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new SphereGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "sphere"
        this.name = params.name ?= "Sphere"

        this.rotation.x = deg$rad 90

        return this

    getRadius: ->

        return clone this.params.radius

    setRadius: (radius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radius = Number radius
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getWidthSegments: ->

        return clone this.params.widthSegments

    setWidthSegments: (widthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.widthSegments = Number widthSegments
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getHeightSegments: ->

        return clone this.params.heightSegments

    setHeightSegments: (heightSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.heightSegments = Number heightSegments
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getPhiStart: ->

        return clone this.params.phiStart

    setPhiStart: (phiStart, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.phiStart = Number phiStart
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getPhiLength: ->

        return clone this.params.phiLength

    setPhiLength: (phiLength, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.phiLength = Number phiLength
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getThetaStart: ->

        return clone this.params.thetaStart

    setThetaStart: (thetaStart, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaStart = Number thetaStart
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"

    getThetaLength: ->

        return clone this.params.thetaLength

    setThetaLength: (thetaLength, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaLength = Number thetaLength
            this.geometry = new SphereGeometry this.params

            if save then this.save "update"
