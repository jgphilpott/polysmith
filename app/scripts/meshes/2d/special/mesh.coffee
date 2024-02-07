class Mesh2DSpecial

    constructor: (type, params = {}) ->

        switch type.lower()

            when "ring"

                @mesh = new POLY.RingMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
