class Geometry1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                geometry = new POLY.LineBufferGeometry params; break

            when "stroke"

                geometry = new POLY.StrokeBufferGeometry params; break

            else

                geometry = params.geometry

        geometry.getDistance = ->

            if this.type is "LineThickGeometry"

                distance = this.attributes.instanceDistanceEnd.data.array

            else

                distance = this.attributes.lineDistance.array

            return adaptor "convert", "length", clone distance[distance.length - 1]

        return geometry
