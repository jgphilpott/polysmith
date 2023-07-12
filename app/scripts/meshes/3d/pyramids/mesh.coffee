class Mesh3DPyramids

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "triangular-pyramid"

                @mesh = new POLY.TriangularPyramidMesh params; break

            when "rectangular-pyramid"

                @mesh = new POLY.RectangularPyramidMesh params; break

            when "pentagonal-pyramid"

                @mesh = new POLY.PentagonalPyramidMesh params; break

            when "hexagonal-pyramid"

                @mesh = new POLY.HexagonalPyramidMesh params; break

            when "heptagonal-pyramid"

                @mesh = new POLY.HeptagonalPyramidMesh params; break

            when "octagonal-pyramid"

                @mesh = new POLY.OctagonalPyramidMesh params; break

            when "nonagonal-pyramid"

                @mesh = new POLY.NonagonalPyramidMesh params; break

            when "decagonal-pyramid"

                @mesh = new POLY.DecagonalPyramidMesh params; break

            when "cone"

                @mesh = new POLY.ConeMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
