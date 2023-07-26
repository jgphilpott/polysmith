class Mesh2D extends Mesh1D

    constructor: (type, params = {}) ->

        type = lower type.trim()

        if type in d2Basic then category = "basic"
        if type in d2Polygons then category = "polygon"
        if type in d2Special then category = "special"

        switch category

            when "basic"

                mesh = new Mesh2DBasic type, params; break

            when "polygon"

                mesh = new Mesh2DPolygon type, params; break

            when "special"

                mesh = new Mesh2DSpecial type, params; break

            else

                mesh = params.mesh

        mesh.getBuffer = ->

            return clone this.geometry.getBuffer()

        mesh.setBuffer = (buffer = true) ->

            this.geometry.setBuffer Boolean buffer

        mesh.fromBuffer = ->

            return this.geometry.fromBuffer()

        mesh.toBuffer = ->

            return this.geometry.toBuffer()

        mesh.getSurface = ->

            return clone this.geometry.getSurface()

        mesh.setSurface = (surface = 0) ->

            this.geometry.setSurface Number surface

        mesh = super type, mesh: mesh

        return mesh
