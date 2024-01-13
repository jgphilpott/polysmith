class Cylinder extends Mesh

    constructor: (params = {}) ->

        super "cylinder", params

class POLY.CylinderMesh extends THREE.Mesh

    constructor: (params = {}) ->

        params.material ?= "normal"

        geometry = new CylinderGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = params.class ?= "cylinder"
        this.name = params.name ?= "Cylinder"

        this.rotation.x = deg$rad 90
        this.rotation.y = deg$rad 90

        return this

    getLength: ->

        return clone this.params.length

    setLength: (length, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.length = Number length
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getPositiveRadius: ->

        return clone this.params.positiveRadius

    setPositiveRadius: (positiveRadius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.positiveRadius = Number positiveRadius
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getNegativeRadius: ->

        return clone this.params.negativeRadius

    setNegativeRadius: (negativeRadius, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.negativeRadius = Number negativeRadius
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getRadialSegments: ->

        return clone this.params.radialSegments

    setRadialSegments: (radialSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.radialSegments = Number radialSegments
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getLengthSegments: ->

        return clone this.params.lengthSegments

    setLengthSegments: (lengthSegments, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.lengthSegments = Number lengthSegments
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getOpenEnded: ->

        return clone this.params.openEnded

    setOpenEnded: (openEnded, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.openEnded = Boolean openEnded
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getThetaStart: ->

        return clone this.params.thetaStart

    setThetaStart: (thetaStart, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaStart = Number thetaStart
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this

    getThetaLength: ->

        return clone this.params.thetaLength

    setThetaLength: (thetaLength, save = true) ->

        if not this.getLock()

            this.geometry.dispose()
            this.params.thetaLength = Number thetaLength
            this.geometry = new CylinderGeometry this.params

            if save then this.save "update"

        return this
