class Geometry

    constructor : (type, params) ->

        @type = lower type.trim()

        switch this.type

            when "box"

                @geometry = new POLY.BoxBufferGeometry params; break

            when "circle"

                @geometry = new POLY.CircleBufferGeometry params; break

        this.geometry.getBuffer = this.getBuffer
        this.geometry.setBuffer = this.setBuffer

        this.geometry.fromBuffer = this.fromBuffer
        this.geometry.toBuffer = this.toBuffer

        this.geometry.getSurface = this.getSurface
        this.geometry.setSurface = this.setSurface

        this.geometry.getVolume = this.getVolume
        this.geometry.setVolume = this.setVolume

        this.geometry.setSurface()
        this.geometry.setVolume()

        return this.geometry

    getBuffer : () ->

        return this.isBufferGeometry

    setBuffer : (buffer) ->

        this.isBufferGeometry = buffer

    fromBuffer : () ->

        if this.getBuffer()

            return new THREE.Geometry().fromBufferGeometry this

        else

            return this

    toBuffer : () ->

        if not this.getBuffer()

            return new THREE.BufferGeometry().fromGeometry this

        else

            return this

    getSurface : () ->

        return this.surface

    setSurface : () -> # Credit: https://stackoverflow.com/a/50937272/1544937

        surface = 0

        geometry = this.fromBuffer()

        if geometry.faces and geometry.vertices

            for face in geometry.faces

                v1 = geometry.vertices[face.a]
                v2 = geometry.vertices[face.b]
                v3 = geometry.vertices[face.c]

                triangle = new THREE.Triangle v1, v2, v3

                surface += triangle.getArea()

        this.surface = surface

        return surface

    getVolume : () ->

        return this.volume

    setVolume : () -> # Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109

        volume = 0

        v1 = new THREE.Vector3()
        v2 = new THREE.Vector3()
        v3 = new THREE.Vector3()

        geometry = this.toBuffer()

        position = geometry.attributes.position

        if geometry.index

            index = geometry.index
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

        return volume
