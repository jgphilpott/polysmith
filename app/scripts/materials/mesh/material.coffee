# Link: https://threejs.org/docs/#api/en/materials/Material

class MeshMaterial

    constructor: (type, params = {}) ->

        switch lower type.trim()

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

        this.material.getOpacity = this.getOpacity
        this.material.setOpacity = this.setOpacity

        this.material.getTransparent = this.getTransparent
        this.material.setTransparent = this.setTransparent

        this.material.setTransparent true

        return this.material

    getColor: ->

        return clone this.color

    setColor: (color) ->

        if color instanceof THREE.Color

            this.color = color

        else

            this.color = new THREE.Color color

    getOpacity: ->

        return clone this.opacity * 100

    setOpacity: (opacity) ->

        this.opacity = Number opacity / 100

    getTransparent: ->

        return clone this.transparent

    setTransparent: (transparent) ->

        this.transparent = Boolean transparent
