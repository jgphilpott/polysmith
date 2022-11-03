# Link: https://threejs.org/docs/#api/en/materials/Material

class LineMaterial

    constructor : (type, color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2, vertexColors = false, alphaToCoverage = false) ->

        @type = lower type.trim()

        switch this.type

            when "basic"

                @material = new BasicLineMaterial color, linewidth; break

            when "dashed"

                @material = new DashedLineMaterial color, linewidth, dashSize, gapSize; break

            when "thick"

                @material = new ThickLineMaterial color, linewidth, dashed, vertexColors, alphaToCoverage; break

        if this.material

            this.material.transparent = true

            if this.type == "thick"

                this.material.resolution.set window.innerWidth, window.innerHeight

        return this.material
