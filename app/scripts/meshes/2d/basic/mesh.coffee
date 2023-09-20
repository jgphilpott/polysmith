class Mesh2DBasic

    constructor: (type, params = {}) ->

        switch type.lower()

            when "circle"

                @mesh = new POLY.CircleMesh params; break

            when "plane"

                @mesh = new POLY.PlaneMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
