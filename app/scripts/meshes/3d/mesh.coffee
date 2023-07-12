class Mesh3D extends Mesh2D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d3Basic then category = "basic"
        if type in d3Hedrons then category = "hedrons"
        if type in d3Prisms then category = "prisms"
        if type in d3Pyramids then category = "pyramids"
        if type in d3Special then category = "special"

        switch category

            when "basic"

                mesh = new Mesh3DBasic type, params; break

            when "hedrons"

                mesh = new Mesh3DHedrons type, params; break

            when "prisms"

                mesh = new Mesh3DPrisms type, params; break

            when "pyramids"

                mesh = new Mesh3DPyramids type, params; break

            when "special"

                mesh = new Mesh3DSpecial type, params; break

            else

                mesh = params.mesh

        return mesh
