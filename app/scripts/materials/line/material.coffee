# Link: https://threejs.org/docs/#api/en/materials/Material

class LineMaterial

    constructor : (type, params = {}) ->

        @type = lower type.trim()

        switch this.type

            when "basic"

                @material = new POLY.BasicLineMaterial params; break

            when "dashed"

                @material = new POLY.DashedLineMaterial params; break

            when "thick"

                @material = new POLY.ThickLineMaterial params; break

            else

                @material = params.material

        if this.material

            this.material.transparent = true

            if this.type == "thick"

                this.material.resolution.set window.innerWidth, window.innerHeight

        return this.material
