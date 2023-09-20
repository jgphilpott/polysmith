# Link: https://threejs.org/docs/#api/en/materials/Material

class MeshMaterial

    constructor: (type, params = {}) ->

        switch type.lower()

            when "basic"

                @material = new POLY.BasicMeshMaterial params; break

            when "depth"

                @material = new POLY.DepthMeshMaterial params; break

            when "distance"

                @material = new POLY.DistanceMeshMaterial params; break

            when "lambert"

                @material = new POLY.LambertMeshMaterial params; break

            when "matcap"

                @material = new POLY.MatcapMeshMaterial params; break

            when "normal"

                @material = new POLY.NormalMeshMaterial params; break

            when "phong"

                @material = new POLY.PhongMeshMaterial params; break

            when "physical"

                @material = new POLY.PhysicalMeshMaterial params; break

            when "standard"

                @material = new POLY.StandardMeshMaterial params; break

            when "toon"

                @material = new POLY.ToonMeshMaterial params; break

            else

                @material = params.material

        this.material.getColor = this.getColor
        this.material.setColor = this.setColor

        this.material.getTransparent = this.getTransparent
        this.material.setTransparent = this.setTransparent

        this.material.getOpacity = this.getOpacity
        this.material.setOpacity = this.setOpacity

        this.material.getMetalness = this.getMetalness
        this.material.setMetalness = this.setMetalness

        this.material.getRoughness = this.getRoughness
        this.material.setRoughness = this.setRoughness

        this.material.getReflectivity = this.getReflectivity
        this.material.setReflectivity = this.setReflectivity

        this.material.getTransmission = this.getTransmission
        this.material.setTransmission = this.setTransmission

        this.material.getWireframe = this.getWireframe
        this.material.setWireframe = this.setWireframe

        this.material.getSide = this.getSide
        this.material.setSide = this.setSide

        return this.material

    getColor: ->

        return clone this.color

    setColor: (color = blackThree) ->

        if color instanceof THREE.Color

            this.color = color

        else

            this.color = new THREE.Color color

    getTransparent: ->

        return clone this.transparent

    setTransparent: (transparent = true) ->

        this.transparent = Boolean transparent

    getOpacity: ->

        return clone this.opacity * 100

    setOpacity: (opacity = 100) ->

        this.opacity = Number opacity / 100

    getMetalness: ->

        return clone this.metalness * 100

    setMetalness: (metalness = 50) ->

        this.metalness = Number metalness / 100

    getRoughness: ->

        return clone this.roughness * 100

    setRoughness: (roughness = 50) ->

        this.roughness = Number roughness / 100

    getReflectivity: ->

        return clone this.reflectivity * 100

    setReflectivity: (reflectivity = 50) ->

        this.reflectivity = Number reflectivity / 100

    getTransmission: ->

        return clone this.transmission * 100

    setTransmission: (transmission = 0) ->

        this.transmission = Number transmission / 100

    getWireframe: ->

        return clone this.wireframe

    setWireframe: (wireframe = false) ->

        this.wireframe = Boolean wireframe

    getSide: ->

        return clone this.side

    setSide: (side = THREE.DoubleSide) ->

        if side is THREE.DoubleSide or side is THREE.FrontSide or side is THREE.BackSide

            this.side = side

        else

            this.side = THREE.DoubleSide
