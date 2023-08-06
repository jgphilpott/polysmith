class Geometry3DHedrons

    constructor: (type, params = {}) ->

        switch lower type

            when "octahedron"

                @geometry = new POLY.OctahedronBufferGeometry params; break

            when "dodecahedron"

                @geometry = new POLY.DodecahedronBufferGeometry params; break

            when "icosahedron"

                @geometry = new POLY.IcosahedronBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
