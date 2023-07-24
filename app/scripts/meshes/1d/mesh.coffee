class Mesh1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                mesh = new POLY.LineMesh params
                this.addMethods mesh; break

            when "stroke"

                mesh = new POLY.StrokeMesh params
                this.addMethods mesh; break

            else

                mesh = params.mesh

        mesh.getBoundingSphere = ->

            return clone this.geometry.getBoundingSphere()

        mesh.setBoundingSphere = (sphere) ->

            this.geometry.setBoundingSphere()

        mesh.getBoundingBox = ->

            return clone this.geometry.getBoundingBox()

        mesh.setBoundingBox = (box) ->

            this.geometry.setBoundingBox()

        return mesh

    addMethods: (mesh) ->

        mesh.getDistance = this.getDistance

        mesh.getVertices = this.getVertices
        mesh.setVertices = this.setVertices

        mesh.getDashed = this.getDashed
        mesh.setDashed = this.setDashed

        mesh.getDashSize = this.getDashSize
        mesh.setDashSize = this.setDashSize

        mesh.getGapSize = this.getGapSize
        mesh.setGapSize = this.setGapSize

    getDistance: ->

        return clone this.geometry.getDistance()

    getVertices: ->

        return clone this.params.vertices

    setVertices: (vertices = [], save = true) ->

        if not this.getLock()

            this.geometry.dispose()

            if this.class is "line"

                this.geometry = new LineGeometry vertices: vertices

            else if this.class is "stroke"

                this.geometry = new StrokeGeometry vertices: vertices

            this.params.vertices = vertices

            this.computeLineDistances()

            if save then this.save "update"

    getDashed: ->

        return clone this.material.getDashed()

    setDashed: (dashed = false, save = true) ->

        if not this.getLock()

            this.params.dashed = Boolean dashed

            if this.type is "Line"

                this.params.material = if this.params.dashed then "dashed" else "solid"

                basic$dashed = this.material.type is "LineBasicMaterial" and this.params.dashed
                dashed$basic = this.material.type is "LineDashedMaterial" and not this.params.dashed

                if basic$dashed or dashed$basic

                    this.material.dispose()

                    this.material = new LineMaterial this.params.material, this.params

            else

                this.material.setDashed this.params.dashed

            this.computeLineDistances()

            if save then this.save "update"

    getDashSize: ->

        return clone this.material.getDashSize()

    setDashSize: (dashSize = adaptor("convert", "length", 3), save = true) ->

        if not this.getLock()

            this.params.dashSize = Number dashSize
            this.material.setDashSize this.params.dashSize

            if save then this.save "update"

    getGapSize: ->

        return clone this.material.getGapSize()

    setGapSize: (gapSize = adaptor("convert", "length", 2), save = true) ->

        if not this.getLock()

            this.params.gapSize = Number gapSize
            this.material.setGapSize this.params.gapSize

            if save then this.save "update"
