class Geometry1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                geometry = new POLY.LineBufferGeometry params
                geometry.getDistance = this.getDistance; break

            when "stroke"

                geometry = new POLY.StrokeBufferGeometry params
                geometry.getDistance = this.getDistance; break

            else

                geometry = params.geometry

        geometry.getBoundingSphere = ->

            boundingSphere = clone this.boundingSphere

            boundingSphere.radius = adaptor "convert", "length", boundingSphere.radius
            boundingSphere.center = vectorAdaptor "convert", "length", boundingSphere.center

            return boundingSphere

        geometry.setBoundingSphere = (sphere) ->

            this.computeBoundingSphere()

        geometry.getBoundingBox = ->

            boundingBox = clone this.boundingBox

            boundingBox.min = vectorAdaptor "convert", "length", boundingBox.min
            boundingBox.max = vectorAdaptor "convert", "length", boundingBox.max

            return boundingBox

        geometry.setBoundingBox = (box) ->

            this.computeBoundingBox()

        geometry.setBoundingSphere()
        geometry.setBoundingBox()

        return geometry

    getDistance: ->

        if this.type is "LineThickGeometry"

            distance = this.attributes.instanceDistanceEnd.data.array

        else

            distance = this.attributes.lineDistance.array

        return adaptor "convert", "length", clone distance[distance.length - 1]
