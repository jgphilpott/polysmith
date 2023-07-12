class Mesh2DPolygon

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "triangle"

                @mesh = new POLY.TriangleMesh params; break

            when "quadrilateral"

                @mesh = new POLY.QuadrilateralMesh params; break

            when "pentagon"

                @mesh = new POLY.PentagonMesh params; break

            when "hexagon"

                @mesh = new POLY.HexagonMesh params; break

            when "heptagon"

                @mesh = new POLY.HeptagonMesh params; break

            when "octagon"

                @mesh = new POLY.OctagonMesh params; break

            when "nonagon"

                @mesh = new POLY.NonagonMesh params; break

            when "decagon"

                @mesh = new POLY.DecagonMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
