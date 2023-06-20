# Link: https://threejs.org/docs/#api/en/lights/DirectionalLight

class DirectionalLight extends Light

    constructor: (params = {}) ->

        super "directional", params

class POLY.DirectionalLight extends THREE.DirectionalLight

    constructor: (params = {}) ->

        lock = params.lock ?= false
        intensity = params.intensity ?= 1
        color = params.color ?= whiteThree
        target = params.target ?= x: 0, y: 0, z: 0
        position = params.position ?= printer.getSize()

        super color, intensity

        this.lock = Boolean lock

        target = vectorAdaptor "invert", "length", target
        position = vectorAdaptor "invert", "length", position

        this.target.position.set target.x, target.y, target.z
        this.position.set position.x, position.y, position.z

        scene.add this.target

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
