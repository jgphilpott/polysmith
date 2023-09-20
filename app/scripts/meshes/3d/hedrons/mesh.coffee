class Mesh3DHedrons

    constructor: (type, params = {}) ->

        switch type.lower()

            when "octahedron"

                @mesh = new POLY.OctahedronMesh params; break

            when "dodecahedron"

                @mesh = new POLY.DodecahedronMesh params; break

            when "icosahedron"

                @mesh = new POLY.IcosahedronMesh params; break

            else

                @mesh = params.mesh

        this.mesh.getRadius = ->

            return clone this.params.radius

        this.mesh.setRadius = (radius, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.radius = Number radius
                this.geometry = new window[this.params.class.capitalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getDetail = ->

            return clone this.params.detail

        this.mesh.setDetail = (detail, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.detail = Number detail
                this.geometry = new window[this.params.class.capitalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getType = ->

            return clone this.params.class

        this.mesh.setType = (type, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.class = String(type).lower()
                this.geometry = new window[this.params.class.capitalize() + "Geometry"] this.params

                if save then this.save "update"

        return this.mesh
