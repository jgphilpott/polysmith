class Geometry2DBasic

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "circle"

                @geometry = new POLY.CircleBufferGeometry params; break

            when "plane"

                @geometry = new POLY.PlaneBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
