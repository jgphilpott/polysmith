class Mesh3DPrisms

    constructor: (type, params = {}) ->

        switch type.lower()

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

        this.mesh.getLength = ->

            return clone this.params.length

        this.mesh.setLength = (length, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.length = Number length
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getPositiveRadius = ->

            return clone this.params.positiveRadius

        this.mesh.setPositiveRadius = (positiveRadius, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.positiveRadius = Number positiveRadius
                this.geometry = new window[this.params.class.pascalize() + "Geometry"] this.params

                if save then this.save "update"

        this.mesh.getNegativeRadius = ->

            return clone this.params.negativeRadius

        this.mesh.setNegativeRadius = (negativeRadius, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.negativeRadius = Number negativeRadius
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

        this.mesh.getLengthSegments = ->

            return clone this.params.lengthSegments

        this.mesh.setLengthSegments = (lengthSegments, save = true) ->

            if not this.getLock()

                this.geometry.dispose()
                this.params.lengthSegments = Number lengthSegments
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
