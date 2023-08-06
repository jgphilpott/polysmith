class Geometry3DPrisms

    constructor: (type, params = {}) ->

        switch lower type

            when "triangular-prism"

                @geometry = new POLY.TriangularPrismBufferGeometry params; break

            when "rectangular-prism"

                @geometry = new POLY.RectangularPrismBufferGeometry params; break

            when "pentagonal-prism"

                @geometry = new POLY.PentagonalPrismBufferGeometry params; break

            when "hexagonal-prism"

                @geometry = new POLY.HexagonalPrismBufferGeometry params; break

            when "heptagonal-prism"

                @geometry = new POLY.HeptagonalPrismBufferGeometry params; break

            when "octagonal-prism"

                @geometry = new POLY.OctagonalPrismBufferGeometry params; break

            when "nonagonal-prism"

                @geometry = new POLY.NonagonalPrismBufferGeometry params; break

            when "decagonal-prism"

                @geometry = new POLY.DecagonalPrismBufferGeometry params; break

            when "cylindrical-prism"

                @geometry = new POLY.CylindricalPrismBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
