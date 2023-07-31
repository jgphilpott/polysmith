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

        this.mesh.getRadius = ->

            return clone this.params.radius

        this.mesh.setRadius = (radius, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                delete this.params.vertices
                this.params.radius = Number radius
                this.geometry = new window[capitalize(this.params.class) + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getVertices = ->

            return clone this.params.vertices

        this.mesh.setVertices = (vertices, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.radius = null
                this.params.vertices = Array.from vertices
                this.geometry = new window[capitalize(this.params.class) + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getType = ->

            return clone this.params.class

        this.mesh.setType = (type, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.class = lower String type
                this.geometry = new window[capitalize(this.params.class) + "Geometry"] this.params

                if save then this.save "update"

        return this.mesh
