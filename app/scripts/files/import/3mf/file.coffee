# Link: https://github.com/mrdoob/three.js/blob/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/loaders/3MFLoader.js

class THREEMFLoader extends THREE.3MFLoader

    constructor: ->

        super()

    import: (file) ->

        return [file]
