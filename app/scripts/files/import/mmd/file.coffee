# Link: https://github.com/mrdoob/three.js/blob/309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83/examples/js/loaders/MMDLoader.js

class MMDLoader extends THREE.MMDLoader

    constructor: ->

        super()

    import: (file) ->

        return [file]
