# Link: https://threejs.org/docs/#api/en/lights/SpotLight

class SpotLight extends Light

    constructor: (params = {}) ->

        super "spot", params

class POLY.SpotLight extends THREE.SpotLight

    constructor: (params = {}) ->

        angleUnit = settings.get "scales.angle.unit"
        angle = convert.angle["radian"][angleUnit] Math.PI / 3

        lock = params.lock ?= false
        decay = params.decay ?= 1
        angle = params.angle ?= angle
        penumbra = params.penumbra ?= 0
        distance = params.distance ?= 0
        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        target = params.target ?= x: 0, y: 0, z: 0
        position = params.position ?= printer.getSize()

        angle = convert.angle[angleUnit]["radian"] angle
        distance = adaptor "invert", "length", distance

        super color, intensity, distance, angle, penumbra, decay

        this.lock = Boolean lock

        target = vectorAdaptor "invert", "length", target
        position = vectorAdaptor "invert", "length", position

        this.target.position.set target.x, target.y, target.z
        this.position.set position.x, position.y, position.z

        scene.add this.target

    getDecay: ->

        return clone this.decay

    setDecay: (decay) ->

        if not this.getLock()

            this.decay = Number decay

    getAngle: ->

        angleUnit = settings.get "scales.angle.unit"

        return convert.angle["radian"][angleUnit] clone this.angle

    setAngle: (angle) ->

        if not this.getLock()

            angleUnit = settings.get "scales.angle.unit"

            this.angle = convert.angle[angleUnit]["radian"] angle

    getPenumbra: ->

        return clone this.penumbra

    setPenumbra: (penumbra) ->

        if not this.getLock()

            this.penumbra = Number penumbra

    getDistance: ->

        return adaptor "convert", "length", clone this.distance

    setDistance: (distance) ->

        if not this.getLock()

            this.distance = adaptor "invert", "length", distance

    getTarget: ->

        return vectorAdaptor "convert", "length", clone this.target.position

    setTarget: (target) ->

        if not this.getLock()

            target = vectorAdaptor "invert", "length", target

            this.target.position.set target.x, target.y, target.z

    getTargetX: ->

        return adaptor "convert", "length", clone this.target.position.x

    setTargetX: (x) ->

        if not this.getLock()

            this.target.position.x = adaptor "invert", "length", x

    getTargetY: ->

        return adaptor "convert", "length", clone this.target.position.y

    setTargetY: (y) ->

        if not this.getLock()

            this.target.position.y = adaptor "invert", "length", y

    getTargetZ: ->

        return adaptor "convert", "length", clone this.target.position.z

    setTargetZ: (z) ->

        if not this.getLock()

            this.target.position.z = adaptor "invert", "length", z
