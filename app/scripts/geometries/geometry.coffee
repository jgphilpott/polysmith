# Link: https://threejs.org/docs/#api/en/core/BufferGeometry

class Geometry

    constructor: (type, params = {}) ->

        type = lower type

        if type in d1 then dimension = "1D"
        if type in d2 then dimension = "2D"
        if type in d3 then dimension = "3D"

        switch dimension

            when "1D"

                @geometry = new Geometry1D type, params

            when "2D"

                @geometry = new Geometry2D type, params

            when "3D"

                @geometry = new Geometry3D type, params

            else

                @geometry = params.geometry

        return this.geometry
