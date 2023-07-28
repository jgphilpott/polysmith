class Ring extends Mesh

    constructor: (params = {}) ->

        super "ring", params

class POLY.RingMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new RingGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "ring"
        this.name = params.name ?= "Ring"

        return this

    getInnerRadius: ->

        return clone this.params.innerRadius

    setInnerRadius: (innerRadius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.innerRadius = Number innerRadius
            this.geometry = new RingGeometry this.params

            if save then this.save "update"

    getOuterRadius: ->

        return clone this.params.outerRadius

    setOuterRadius: (outerRadius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.outerRadius = Number outerRadius
            this.geometry = new RingGeometry this.params

            if save then this.save "update"

    getThetaSegments: ->

        return clone this.params.thetaSegments

    setThetaSegments: (thetaSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaSegments = Number thetaSegments
            this.geometry = new RingGeometry this.params

            if save then this.save "update"

    getPhiSegments: ->

        return clone this.params.phiSegments

    setPhiSegments: (phiSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.phiSegments = Number phiSegments
            this.geometry = new RingGeometry this.params

            if save then this.save "update"

    getThetaStart: ->

        return clone this.params.thetaStart

    setThetaStart: (thetaStart, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaStart = Number thetaStart
            this.geometry = new RingGeometry this.params

            if save then this.save "update"

    getThetaLength: ->

        return clone this.params.thetaLength

    setThetaLength: (thetaLength, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaLength = Number thetaLength
            this.geometry = new RingGeometry this.params

            if save then this.save "update"
