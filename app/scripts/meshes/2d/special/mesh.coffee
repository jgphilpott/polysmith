class Mesh2DSpecial

    constructor: (type, params = {}) ->

        switch lower type

            when "ring"

                @mesh = new POLY.RingMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
