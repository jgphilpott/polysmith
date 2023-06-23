class Geometry1D

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "line"

                @geometry = new POLY.LineBufferGeometry params; break

            when "stroke"

                @geometry = new POLY.StrokeBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
