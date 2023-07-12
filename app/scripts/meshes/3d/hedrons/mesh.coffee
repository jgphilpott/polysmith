class Mesh3DHedrons

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "octahedron"

                @mesh = new POLY.OctahedronMesh params; break

            when "dodecahedron"

                @mesh = new POLY.DodecahedronMesh params; break

            when "icosahedron"

                @mesh = new POLY.IcosahedronMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
