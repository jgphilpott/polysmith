class Geometry3DPyramids

    constructor: (type, params = {}) ->

        switch lower type

            when "triangular-pyramid"

                @geometry = new POLY.TriangularPyramidBufferGeometry params; break

            when "rectangular-pyramid"

                @geometry = new POLY.RectangularPyramidBufferGeometry params; break

            when "pentagonal-pyramid"

                @geometry = new POLY.PentagonalPyramidBufferGeometry params; break

            when "hexagonal-pyramid"

                @geometry = new POLY.HexagonalPyramidBufferGeometry params; break

            when "heptagonal-pyramid"

                @geometry = new POLY.HeptagonalPyramidBufferGeometry params; break

            when "octagonal-pyramid"

                @geometry = new POLY.OctagonalPyramidBufferGeometry params; break

            when "nonagonal-pyramid"

                @geometry = new POLY.NonagonalPyramidBufferGeometry params; break

            when "decagonal-pyramid"

                @geometry = new POLY.DecagonalPyramidBufferGeometry params; break

            when "cone"

                @geometry = new POLY.ConeBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
