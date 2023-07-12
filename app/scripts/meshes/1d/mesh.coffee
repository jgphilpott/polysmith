class Mesh1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d1Line then category = "line"
        if type in d1Stroke then category = "stroke"

        switch category

            when "line"

                mesh = new POLY.LineMesh params; break

            when "stroke"

                mesh = new POLY.StrokeMesh params; break

            else

                mesh = params.mesh

        return mesh
