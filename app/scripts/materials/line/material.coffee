# Link: https://threejs.org/docs/#api/en/materials/Material

class LineMaterial

    constructor : (type, params = {}) ->

        @type = lower type.trim()

        switch this.type

            when "dashed"

                @material = new POLY.DashedLineMaterial params; break

            when "solid"

                @material = new POLY.SolidLineMaterial params; break

            when "stroke"

                @material = new POLY.StrokeLineMaterial params; break

            else

                @material = params.material

        if this.material

            this.material.transparent = true

            if this.type == "stroke"

                this.material.resolution.set window.innerWidth, window.innerHeight

        return this.material
