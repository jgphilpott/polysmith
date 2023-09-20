class Mesh3DPyramids

    constructor: (type, params = {}) ->

        switch type.lower()

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

        this.mesh.getRadius = ->

            return clone this.params.radius

        this.mesh.setRadius = (radius, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.radius = Number radius
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getHeight = ->

            return clone this.params.height

        this.mesh.setHeight = (height, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.height = Number height
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getRadialSegments = ->

            return clone this.params.radialSegments

        this.mesh.setRadialSegments = (radialSegments, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.radialSegments = Number radialSegments
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getHeightSegments = ->

            return clone this.params.heightSegments

        this.mesh.setHeightSegments = (heightSegments, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.heightSegments = Number heightSegments
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getOpenEnded = ->

            return clone this.params.openEnded

        this.mesh.setOpenEnded = (openEnded, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.openEnded = Boolean openEnded
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getThetaStart = ->

            return clone this.params.thetaStart

        this.mesh.setThetaStart = (thetaStart, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.thetaStart = Number thetaStart
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getThetaLength = ->

            return clone this.params.thetaLength

        this.mesh.setThetaLength = (thetaLength, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.thetaLength = Number thetaLength
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getType = ->

            return clone this.params.class

        this.mesh.setType = (type, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.class = String(type).lower()
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        return this.mesh
