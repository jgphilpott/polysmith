class CameraSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        type: "perspective"
        position:

            x: 240
            y: 240
            z: 120

        target:

            x: 0
            y: 0
            z: 0

        near: 0.1
        far: 1000
        fov: 75

    update: (path, value) ->

        null
