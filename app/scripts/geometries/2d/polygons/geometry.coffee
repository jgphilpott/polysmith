class Geometry2DPolygon

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "triangle"

                @geometry = new POLY.TriangleBufferGeometry params; break

            when "quadrilateral"

                @geometry = new POLY.QuadrilateralBufferGeometry params; break

            when "pentagon"

                @geometry = new POLY.PentagonBufferGeometry params; break

            when "hexagon"

                @geometry = new POLY.HexagonBufferGeometry params; break

            when "heptagon"

                @geometry = new POLY.HeptagonBufferGeometry params; break

            when "octagon"

                @geometry = new POLY.OctagonBufferGeometry params; break

            when "nonagon"

                @geometry = new POLY.NonagonBufferGeometry params; break

            when "decagon"

                @geometry = new POLY.DecagonBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
