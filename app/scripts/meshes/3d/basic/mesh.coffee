class Mesh3DBasic

    constructor: (type, params = {}) ->

        switch type.lower()

            when "box"

                @mesh = new POLY.BoxMesh params; break

            when "cylinder"

                @mesh = new POLY.CylinderMesh params; break

            when "sphere"

                @mesh = new POLY.SphereMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
