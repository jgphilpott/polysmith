# Link: https://threejs.org/docs/#api/en/materials/Material

class MeshMaterial

    constructor : (type, color = blackThree, texture = null, side = THREE.DoubleSide) ->

        @type = type.toLowerCase().trim()

        switch this.type

            when "basic"

                @material = new BasicMeshMaterial color, texture, side; break

            when "depth"

                @material = new DepthMeshMaterial side; break

            when "distance"

                @material = new DistanceMeshMaterial side; break

            when "lambert"

                @material = new LambertMeshMaterial color, texture, side; break

            when "matcap"

                @material = new MatcapMeshMaterial color, texture, side; break

            when "normal"

                @material = new NormalMeshMaterial side; break

            when "phong"

                @material = new PhongMeshMaterial color, texture, side; break

            when "physical"

                @material = new PhysicalMeshMaterial color, texture, side; break

            when "standard"

                @material = new StandardMeshMaterial color, texture, side; break

            when "toon"

                @material = new ToonMeshMaterial color, texture, side; break

        if this.material

            this.material.transparent = true

            if color == blackThree

                this.material.metalness = -25
                this.material.roughness = 0.75

            else

                this.material.metalness = 0.5
                this.material.roughness = 0.5

        return this.material
