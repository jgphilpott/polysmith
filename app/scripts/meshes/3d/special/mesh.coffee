class Mesh3DSpecial

    constructor: (type, params = {}) ->

        switch lower type.trim()

            when "capsule"

                @mesh = new POLY.CapsuleMesh params; break

            when "image"

                @mesh = new POLY.ImageMesh params; break

            when "knot"

                @mesh = new POLY.KnotMesh params; break

            when "text"

                @mesh = new POLY.TextMesh params; break

            when "torus"

                @mesh = new POLY.TorusMesh params; break

            when "tube"

                @mesh = new POLY.TubeMesh params; break

            else

                @mesh = params.mesh

        return this.mesh
