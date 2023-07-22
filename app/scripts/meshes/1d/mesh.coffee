class Mesh1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                mesh = new POLY.LineMesh params

                mesh.getDistance = this.getDistance
                mesh.getVertices = this.getVertices
                mesh.setVertices = this.setVertices

                break

            when "stroke"

                mesh = new POLY.StrokeMesh params

                mesh.getDistance = this.getDistance
                mesh.getVertices = this.getVertices
                mesh.setVertices = this.setVertices

                break

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

    getDistance: ->

        return clone this.geometry.getDistance()

    getVertices: ->

        vertices = clone this.geometry.vertices

        for vertex in vertices

            vertex[0] = adaptor "convert", "length", vertex[0]
            vertex[1] = adaptor "convert", "length", vertex[1]
            vertex[2] = adaptor "convert", "length", vertex[2]

        return vertices

    setVertices: (vertices) ->

        this.geometry.dispose()

        if this.class is "line"

            this.geometry = new LineGeometry vertices: vertices

        else if this.class is "stroke"

            this.geometry = new StrokeGeometry vertices: vertices

        this.computeLineDistances()
