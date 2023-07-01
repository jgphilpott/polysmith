class Geometry3DSpecial

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "capsule"

                @geometry = new POLY.CapsuleBufferGeometry params; break

            when "image"

                @geometry = new POLY.ImageBufferGeometry params; break

            when "knot"

                @geometry = new POLY.KnotBufferGeometry params; break

            when "text"

                @geometry = new POLY.TextBufferGeometry params; break

            when "torus"

                @geometry = new POLY.TorusBufferGeometry params; break

            when "tube"

                @geometry = new POLY.TubeBufferGeometry params; break

            else

                @geometry = params.geometry

        return this.geometry
