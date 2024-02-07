class Geometry2D extends Geometry1D

    constructor: (type, params = {}) ->

        type = type.lower()

        if type in d2Basic then category = "basic"
        if type in d2Polygons then category = "polygon"
        if type in d2Special then category = "special"

        switch category

            when "basic"

                geometry = new Geometry2DBasic type, params; break

            when "polygon"

                geometry = new Geometry2DPolygon type, params; break

            when "special"

                geometry = new Geometry2DSpecial type, params; break

            else

                geometry = params.geometry

        geometry.getBuffer = ->

            return clone this.isBufferGeometry

        geometry.setBuffer = (buffer = true) ->

            this.isBufferGeometry = Boolean buffer

            return this

        geometry.fromBuffer = ->

            if this.getBuffer()

                return new THREE.Geometry().fromBufferGeometry this

            else

                return this

        geometry.toBuffer = ->

            if not this.getBuffer()

                return new THREE.BufferGeometry().fromGeometry this

            else

                return this

        geometry.getSurface = ->

            return adaptor "convert", "area", clone this.surface

        geometry.setSurface = (surface = 0) -> # Credit: https://stackoverflow.com/a/50937272/1544937

            shape = this.fromBuffer()

            if shape.faces and shape.vertices

                for face in shape.faces

                    v1 = shape.vertices[face.a]
                    v2 = shape.vertices[face.b]
                    v3 = shape.vertices[face.c]

                    triangle = new THREE.Triangle v1, v2, v3

                    surface += triangle.getArea()

            this.surface = surface

            return this

        geometry = super type, geometry: geometry

        geometry.setSurface()

        return geometry
