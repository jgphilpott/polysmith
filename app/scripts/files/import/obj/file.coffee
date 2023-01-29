# Link: https://github.com/mrdoob/three.js/blob/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/OBJLoader.js

class OBJLoader extends THREE.OBJLoader

    constructor: ->

        super()

    import: (file) ->

        objects = []

        file.traverse (property) ->

            if property instanceof THREE.Mesh

                property.material = new MeshMaterial "normal"

                objects.push property

        return objects
