class Geometry3DBasic

    constructor: (type, params = {}) ->

        switch type.lower()

            when "box"

                @geometry = new POLY.BoxBufferGeometry params; break

            when "cylinder"

                @geometry = new POLY.CylinderBufferGeometry params; break

            when "sphere"

                @geometry = new POLY.SphereBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
