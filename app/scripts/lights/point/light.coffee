# Link: https://threejs.org/docs/#api/en/lights/PointLight

class PointLight extends Light

    constructor: (params = {}) ->

        super "point", params

class POLY.PointLight extends THREE.PointLight

    constructor: (params = {}) ->

        lock = params.lock ?= false
        decay = params.decay ?= 1
        distance = params.distance ?= 0
        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        position = params.position ?= printer.getSize()

        distance = adaptor "invert", "length", distance

        super color, intensity, distance, decay

        this.lock = Boolean lock

        position = vectorAdaptor "invert", "length", position

        this.position.set position.x, position.y, position.z

    getDecay: ->

        return clone this.decay

    setDecay: (decay) ->

        if not this.getLock()

            this.decay = Number decay

    getDistance: ->

        return adaptor "convert", "length", clone this.distance

    setDistance: (distance) ->

        if not this.getLock()

            this.distance = adaptor "invert", "length", distance
