# Link: https://threejs.org/docs/#api/en/materials/Material

class Material

    constructor: (category, type, params = {}) ->

        switch lower category

            when "line"

                @material = new LineMaterial type, params; break

            when "mesh"

                @material = new MeshMaterial type, params; break

            else

                @material = params.material

        return this.material
