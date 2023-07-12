class Mesh3DPrisms

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "triangular-prism"

                @mesh = new POLY.TriangularPrismMesh params; break

            when "rectangular-prism"

                @mesh = new POLY.RectangularPrismMesh params; break

            when "pentagonal-prism"

                @mesh = new POLY.PentagonalPrismMesh params; break

            when "hexagonal-prism"

                @mesh = new POLY.HexagonalPrismMesh params; break

            when "heptagonal-prism"

                @mesh = new POLY.HeptagonalPrismMesh params; break

            when "octagonal-prism"

                @mesh = new POLY.OctagonalPrismMesh params; break

            when "nonagonal-prism"

                @mesh = new POLY.NonagonalPrismMesh params; break

            when "decagonal-prism"

                @mesh = new POLY.DecagonalPrismMesh params; break

            when "cylindrical-prism"

                @mesh = new POLY.CylindricalPrismMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
