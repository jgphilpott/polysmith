# Link: https://threejs.org/docs/#api/en/lights/HemisphereLight

class HemisphereLight extends Light

    constructor: (params = {}) ->

        super "hemisphere", params

class POLY.HemisphereLight extends THREE.HemisphereLight

    constructor: (params = {}) ->

        lock = params.lock ?= false
        intensity = params.intensity ?= 1
        skyColor = params.skyColor ?= whiteThree
        groundColor = params.groundColor ?= blackThree
        position = params.position ?= printer.getSize()

        super skyColor, groundColor, intensity

        this.lock = Boolean lock

        position = vectorAdaptor "invert", "length", position

        this.position.set position.x, position.y, position.z

    getSkyColor: ->

        return clone this.color

    setSkyColor: (color) ->

        if not this.getLock()

            if color instanceof THREE.Color

                this.color = color

            else

                this.color = new THREE.Color color

    getGroundColor: ->

        return clone this.groundColor

    setGroundColor: (color) ->

        if not this.getLock()

            if color instanceof THREE.Color

                this.groundColor = color

            else

                this.groundColor = new THREE.Color color
