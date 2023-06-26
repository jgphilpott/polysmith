class Geometry2DSpecial

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "ring"

                @geometry = new POLY.RingBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
