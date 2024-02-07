class Geometry1D

    constructor: (type, params = {}) ->

        type = type.lower()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                geometry = new POLY.LineBufferGeometry params

                geometry.getDistance = this.getDistance
                geometry.setDistance = this.setDistance

                break

            when "stroke"

                geometry = new POLY.StrokeBufferGeometry params

                geometry.getDistance = this.getDistance
                geometry.setDistance = this.setDistance

                break

            else

                geometry = params.geometry

        geometry.getBoundingSphere = ->

            boundingSphere = clone this.boundingSphere

            boundingSphere.radius = adaptor "convert", "length", boundingSphere.radius
            boundingSphere.center = vectorAdaptor "convert", "length", boundingSphere.center

            return boundingSphere

        geometry.setBoundingSphere = (sphere) ->

            this.computeBoundingSphere()

            return this

        geometry.getBoundingBox = ->

            boundingBox = clone this.boundingBox

            boundingBox.min = vectorAdaptor "convert", "length", boundingBox.min
            boundingBox.max = vectorAdaptor "convert", "length", boundingBox.max

            return boundingBox

        geometry.setBoundingBox = (box) ->

            this.computeBoundingBox()

            return this

        geometry.setBoundingSphere()
        geometry.setBoundingBox()

        return geometry

    getDistance: ->

        if this.type is "LineThickGeometry"

            distance = this.attributes.instanceDistanceEnd.data.array

        else

            distance = this.attributes.lineDistance.array

        return adaptor "convert", "length", clone distance.last()

    setDistance: ->

        return this
