class Geometry2DSpecial

    constructor: (type, params = {}) ->

        switch type.lower()

            when "ring"

                @geometry = new POLY.RingBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
