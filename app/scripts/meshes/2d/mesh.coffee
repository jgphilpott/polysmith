class Mesh2D extends Mesh1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d2Basic then category = "basic"
        if type in d2Polygons then category = "polygon"
        if type in d2Special then category = "special"

        switch category

            when "basic"

                mesh = new Mesh2DBasic type, params; break

            when "polygon"

                mesh = new Mesh2DPolygon type, params; break

            when "special"

                mesh = new Mesh2DSpecial type, params; break

            else

                mesh = params.mesh

        return mesh
