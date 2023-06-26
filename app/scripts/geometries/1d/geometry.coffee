class Geometry1D

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "line"

                @geometry = new POLY.LineBufferGeometry params; break

            when "stroke"

                @geometry = new POLY.StrokeBufferGeometry params; break

            else

                @geometry = params.geometry

        this.geometry.getDistance = this.getDistance

        return this.geometry

    getDistance: ->

        if this.type is "LineThickGeometry"

            distance = this.attributes.instanceDistanceEnd.data.array

        else

            distance = this.attributes.lineDistance.array

        return adaptor "convert", "length", clone distance[distance.length - 1]
