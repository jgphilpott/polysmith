class Mesh2DBasic

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "circle"

                @mesh = new POLY.CircleMesh params; break

            when "plane"

                @mesh = new POLY.PlaneMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
