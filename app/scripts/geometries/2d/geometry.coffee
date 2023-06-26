class Geometry2D extends Geometry1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d2Basic then category = "basic"
        if type in d2Polygons then category = "polygon"
        if type in d2Special then category = "special"

        switch category

            when "basic"

                @geometry = new Geometry2DBasic type, params; break

            when "polygon"

                @geometry = new Geometry2DPolygon type, params; break

            when "special"

                @geometry = new Geometry2DSpecial type, params; break

            else

                @geometry = params.geometry

        return this.geometry
