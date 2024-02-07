# Link: https://github.com/mrdoob/three.js/blob/309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83/examples/js/loaders/OBJLoader.js

class OBJLoader extends THREE.OBJLoader

    constructor: ->

        super()

    import: (file) ->

        meshes = []

        file.traverse (property) ->

            if property instanceof THREE.Mesh

                property.material = new MeshMaterial "normal"

                meshes.push property

        return meshes
