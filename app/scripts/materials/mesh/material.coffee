# Link: https://threejs.org/docs/#api/en/materials/Material

class MeshMaterial

    constructor : (type, params = {}) ->

        @type = lower type.trim()

        switch this.type

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

        if this.material

            this.material.transparent = true

            if equal this.material.color, blackThree

                this.material.metalness = -25
                this.material.roughness = 0.75

            else

                this.material.metalness = 0.5
                this.material.roughness = 0.5

        return this.material
