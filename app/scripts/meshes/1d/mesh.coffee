class Mesh1D

    constructor: (type, params = {}) ->

        type = lower type

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

        mesh.getLinewidth = this.getLinewidth
        mesh.setLinewidth = this.setLinewidth

        mesh.getDashed = this.getDashed
        mesh.setDashed = this.setDashed

        mesh.getDashSize = this.getDashSize
        mesh.setDashSize = this.setDashSize

        mesh.getGapSize = this.getGapSize
        mesh.setGapSize = this.setGapSize

        mesh.getType = this.getType
        mesh.setType = this.setType

    getDistance: ->

        return clone this.geometry.getDistance()

    getVertices: ->

        return clone this.params.vertices

    setVertices: (vertices, save = true) ->

        if not this.getLock()

            this.geometry.dispose()

            this.params.vertices = Array.from vertices

            if this.class is "line"

                this.geometry = new LineGeometry this.params

            else if this.class is "stroke"

                this.geometry = new StrokeGeometry this.params

            this.computeLineDistances()

            if save then this.save "update"

    getLinewidth: ->

        return clone this.material.getLinewidth()

    setLinewidth: (linewidth, save = true) ->

        if not this.getLock()

            this.params.linewidth = Number linewidth
            this.material.setLinewidth this.params.linewidth

            if save then this.save "update"

    getDashed: ->

        return clone this.material.getDashed()

    setDashed: (dashed, save = true) ->

        if not this.getLock()

            this.params.dashed = Boolean dashed

            if this.class is "line"

                basic$dashed = this.material.type is "LineBasicMaterial" and this.params.dashed
                dashed$basic = this.material.type is "LineDashedMaterial" and not this.params.dashed

                if basic$dashed or dashed$basic

                    this.material.dispose()

                    this.params.material = if this.params.dashed then "dashed" else "solid"
                    this.material = new LineMaterial this.params.material, this.params

            else

                this.material.setDashed this.params.dashed

            this.computeLineDistances()

            if save then this.save "update"

    getDashSize: ->

        return clone this.material.getDashSize()

    setDashSize: (dashSize, save = true) ->

        if not this.getLock()

            this.params.dashSize = Number dashSize
            this.material.setDashSize this.params.dashSize

            if save then this.save "update"

    getGapSize: ->

        return clone this.material.getGapSize()

    setGapSize: (gapSize, save = true) ->

        if not this.getLock()

            this.params.gapSize = Number gapSize
            this.material.setGapSize this.params.gapSize

            if save then this.save "update"

    getType: ->

        return clone this.params.class

    setType: (type, save = true) ->

        if not this.getLock()

            if this.class is "line" and type is "stroke"

                this.geometry.dispose()
                this.material.dispose()

                this.params.class = "stroke"
                this.params.material = "stroke"

                this.__proto__ = LineThickMesh.prototype

                this.geometry = new StrokeGeometry this.params
                this.material = new LineMaterial this.params.material, this.params

            else if this.class is "stroke" and type is "line"

                this.geometry.dispose()
                this.material.dispose()

                this.params.class = "line"
                this.params.material = if this.getDashed() then "dashed" else "solid"

                this.__proto__ = THREE.Line.prototype

                this.geometry = new LineGeometry this.params
                this.material = new LineMaterial this.params.material, this.params

            this.computeLineDistances()

            if save then this.save "update"
