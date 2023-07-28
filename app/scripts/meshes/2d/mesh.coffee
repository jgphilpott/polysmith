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

        mesh.getMaterial = ->

            return clone this.params.material

        mesh.setMaterial = (material = "normal", save = true) ->

            if not this.getLock()

                this.material.dispose()
                this.params.material = lower String material
                this.material = new MeshMaterial this.params.material, this.params

                if save then this.save "update"

        mesh.getMetalness = ->

            return clone this.params.metalness

        mesh.setMetalness = (metalness = 50, save = true) ->

            if not this.getLock()

                this.params.metalness = Number metalness
                this.material.setMetalness this.params.metalness

                if save then this.save "update"

        mesh.getRoughness = ->

            return clone this.params.roughness

        mesh.setRoughness = (roughness = 50, save = true) ->

            if not this.getLock()

                this.params.roughness = Number roughness
                this.material.setRoughness this.params.roughness

                if save then this.save "update"

        mesh.getReflectivity = ->

            return clone this.params.reflectivity

        mesh.setReflectivity = (reflectivity = 50, save = true) ->

            if not this.getLock()

                this.params.reflectivity = Number reflectivity
                this.material.setReflectivity this.params.reflectivity

                if save then this.save "update"

        mesh.getTransmission = ->

            return clone this.params.transmission

        mesh.setTransmission = (transmission = 0, save = true) ->

            if not this.getLock()

                this.params.transmission = Number transmission
                this.material.setTransmission this.params.transmission

                if save then this.save "update"

        mesh.getWireframe = ->

            return clone this.params.wireframe

        mesh.setWireframe = (wireframe = false, save = true) ->

            if not this.getLock()

                this.params.wireframe = Boolean wireframe
                this.material.setWireframe this.params.wireframe

                if save then this.save "update"

        mesh.getSide = ->

            return clone this.params.side

        mesh.setSide = (side = THREE.DoubleSide, save = true) ->

            if not this.getLock()

                this.params.side = Number side
                this.material.setSide this.params.side

                if save then this.save "update"

        mesh = super type, mesh: mesh

        return mesh
