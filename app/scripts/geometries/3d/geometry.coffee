class Geometry3D extends Geometry2D

    constructor: (type, params = {}) ->

        type = type.lower()

        if type in d3Basic then category = "basic"
        if type in d3Hedrons then category = "hedrons"
        if type in d3Prisms then category = "prisms"
        if type in d3Pyramids then category = "pyramids"
        if type in d3Special then category = "special"

        switch category

            when "basic"

                geometry = new Geometry3DBasic type, params; break

            when "hedrons"

                geometry = new Geometry3DHedrons type, params; break

            when "prisms"

                geometry = new Geometry3DPrisms type, params; break

            when "pyramids"

                geometry = new Geometry3DPyramids type, params; break

            when "special"

                geometry = new Geometry3DSpecial type, params; break

            else

                geometry = params.geometry

        geometry.getVolume = ->

            return adaptor "convert", "volume", clone this.volume

        geometry.setVolume = (volume = 0) -> # Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109

            shape = this.toBuffer()

            v1 = new THREE.Vector3()
            v2 = new THREE.Vector3()
            v3 = new THREE.Vector3()

            position = shape.attributes.position

            if shape.index

                index = shape.index
                faces = index.count / 3

                for face in [0...faces]

                    v1.fromBufferAttribute position, index.array[face * 3 + 0]
                    v2.fromBufferAttribute position, index.array[face * 3 + 1]
                    v3.fromBufferAttribute position, index.array[face * 3 + 2]

                    volume += signedVolumeOfTriangle v1, v2, v3

            else

                faces = position.count / 3

                for face in [0...faces]

                    v1.fromBufferAttribute position, face * 3 + 0
                    v2.fromBufferAttribute position, face * 3 + 1
                    v3.fromBufferAttribute position, face * 3 + 2

                    volume += signedVolumeOfTriangle v1, v2, v3

            this.volume = volume

            return this

        geometry = super type, geometry: geometry

        geometry.setVolume()

        return geometry
