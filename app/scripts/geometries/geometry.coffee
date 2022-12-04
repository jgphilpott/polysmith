# Link: https://threejs.org/docs/#api/en/core/BufferGeometry

class Geometry

    constructor : (type, params = {}) ->

        @type = lower type.trim()

        switch this.type

            when "box"

                @geometry = new POLY.BoxBufferGeometry params; break

            when "cylinder"

                @geometry = new POLY.CylinderBufferGeometry params; break

            when "sphere"

                @geometry = new POLY.SphereBufferGeometry params; break

            when "octahedron"

                @geometry = new POLY.OctahedronBufferGeometry params; break

            when "dodecahedron"

                @geometry = new POLY.DodecahedronBufferGeometry params; break

            when "icosahedron"

                @geometry = new POLY.IcosahedronBufferGeometry params; break

            when "triangular-prism"

                @geometry = new POLY.TriangularPrismBufferGeometry params; break

            when "rectangular-prism"

                @geometry = new POLY.RectangularPrismBufferGeometry params; break

            when "pentagonal-prism"

                @geometry = new POLY.PentagonalPrismBufferGeometry params; break

            when "hexagonal-prism"

                @geometry = new POLY.HexagonalPrismBufferGeometry params; break

            when "heptagonal-prism"

                @geometry = new POLY.HeptagonalPrismBufferGeometry params; break

            when "octagonal-prism"

                @geometry = new POLY.OctagonalPrismBufferGeometry params; break

            when "nonagonal-prism"

                @geometry = new POLY.NonagonalPrismBufferGeometry params; break

            when "decagonal-prism"

                @geometry = new POLY.DecagonalPrismBufferGeometry params; break

            when "cylindrical-prism"

                @geometry = new POLY.CylindricalPrismBufferGeometry params; break

            when "triangular-pyramid"

                @geometry = new POLY.TriangularPyramidBufferGeometry params; break

            when "rectangular-pyramid"

                @geometry = new POLY.RectangularPyramidBufferGeometry params; break

            when "pentagonal-pyramid"

                @geometry = new POLY.PentagonalPyramidBufferGeometry params; break

            when "hexagonal-pyramid"

                @geometry = new POLY.HexagonalPyramidBufferGeometry params; break

            when "heptagonal-pyramid"

                @geometry = new POLY.HeptagonalPyramidBufferGeometry params; break

            when "octagonal-pyramid"

                @geometry = new POLY.OctagonalPyramidBufferGeometry params; break

            when "nonagonal-pyramid"

                @geometry = new POLY.NonagonalPyramidBufferGeometry params; break

            when "decagonal-pyramid"

                @geometry = new POLY.DecagonalPyramidBufferGeometry params; break

            when "cone"

                @geometry = new POLY.ConeBufferGeometry params; break

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

            when "circle"

                @geometry = new POLY.CircleBufferGeometry params; break

            when "plane"

                @geometry = new POLY.PlaneBufferGeometry params; break

            when "triangle"

                @geometry = new POLY.TriangleBufferGeometry params; break

            when "quadrilateral"

                @geometry = new POLY.QuadrilateralBufferGeometry params; break

            when "pentagon"

                @geometry = new POLY.PentagonBufferGeometry params; break

            when "hexagon"

                @geometry = new POLY.HexagonBufferGeometry params; break

            when "heptagon"

                @geometry = new POLY.HeptagonBufferGeometry params; break

            when "octagon"

                @geometry = new POLY.OctagonBufferGeometry params; break

            when "nonagon"

                @geometry = new POLY.NonagonBufferGeometry params; break

            when "decagon"

                @geometry = new POLY.DecagonBufferGeometry params; break

            when "ring"

                @geometry = new POLY.RingBufferGeometry params; break

            when "line"

                @geometry = new POLY.LineBufferGeometry params; break

            when "stroke"

                @geometry = new POLY.StrokeBufferGeometry params; break

            else

                @geometry = params.geometry

        this.geometry.getBuffer = this.getBuffer
        this.geometry.setBuffer = this.setBuffer

        this.geometry.fromBuffer = this.fromBuffer
        this.geometry.toBuffer = this.toBuffer

        this.geometry.getSurface = this.getSurface
        this.geometry.setSurface = this.setSurface

        this.geometry.getBoundingBox = this.getBoundingBox
        this.geometry.setBoundingBox = this.setBoundingBox

        this.geometry.getBoundingSphere = this.getBoundingSphere
        this.geometry.setBoundingSphere = this.setBoundingSphere

        this.geometry.getVolume = this.getVolume
        this.geometry.setVolume = this.setVolume

        this.translate = this.geometry.translate
        this.center = this.geometry.center

        this.geometry.setBoundingBox()
        this.geometry.setBoundingSphere()

        if this.type isnt "line" and this.type isnt "stroke"

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

    getBoundingBox : () ->

        return this.boundingBox

    setBoundingBox : (box) ->

        this.computeBoundingBox()

    getBoundingSphere : () ->

        return this.boundingSphere

    setBoundingSphere : (sphere) ->

        this.computeBoundingSphere()

    getSurface : () ->

        return this.surface

    setSurface : (surface) -> # Credit: https://stackoverflow.com/a/50937272/1544937

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

    getVolume : () ->

        return this.volume

    setVolume : (volume) -> # Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109

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
