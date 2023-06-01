# Link: https://threejs.org/docs/#api/en/materials/Material

class LineMaterial

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "dashed"

                @material = new POLY.DashedLineMaterial params; break

            when "solid"

                @material = new POLY.SolidLineMaterial params; break

            when "stroke"

                @material = new POLY.StrokeLineMaterial params; break

            else

                @material = params.material

        return this.material
