# Link: https://threejs.org/docs/#api/en/lights/Light

class Light

    constructor: (type, params = {}) ->

        switch lower type

            when "ambient"

                @light = new POLY.AmbientLight params; break

            when "directional"

                @light = new POLY.DirectionalLight params; break

            when "hemisphere"

                @light = new POLY.HemisphereLight params; break

            when "point"

                @light = new POLY.PointLight params; break

            when "spot"

                @light = new POLY.SpotLight params; break

            else

                @light = params.light

        this.light.add = this.add
        this.light.remove = this.remove

        this.light.getPosition = this.getPosition
        this.light.setPosition = this.setPosition

        this.light.getPositionX = this.getPositionX
        this.light.setPositionX = this.setPositionX

        this.light.getPositionY = this.getPositionY
        this.light.setPositionY = this.setPositionY

        this.light.getPositionZ = this.getPositionZ
        this.light.setPositionZ = this.setPositionZ

        this.light.getIntensity = this.getIntensity
        this.light.setIntensity = this.setIntensity

        this.light.getColor = this.getColor
        this.light.setColor = this.setColor

        this.light.toggleLock = this.toggleLock
        this.light.getLock = this.getLock
        this.light.setLock = this.setLock

        return this.light

    add: ->

        if not this.getLock()

            scene.add this

            lights.push this

        return this

    remove: ->

        if not this.getLock()

            scene.remove this

            lights.exclude (light) =>

                light.uuid is this.uuid

        return this

    getPosition: ->

        return vectorAdaptor "convert", "length", clone this.position

    setPosition: (position) ->

        if not this.getLock()

            position = vectorAdaptor "invert", "length", position

            this.position.set position.x, position.y, position.z

    getPositionX: ->

        return adaptor "convert", "length", clone this.position.x

    setPositionX: (x) ->

        if not this.getLock()

            this.position.x = adaptor "invert", "length", x

    getPositionY: ->

        return adaptor "convert", "length", clone this.position.y

    setPositionY: (y) ->

        if not this.getLock()

            this.position.y = adaptor "invert", "length", y

    getPositionZ: ->

        return adaptor "convert", "length", clone this.position.z

    setPositionZ: (z) ->

        if not this.getLock()

            this.position.z = adaptor "invert", "length", z

    getIntensity: ->

        return clone this.intensity

    setIntensity: (intensity) ->

        if not this.getLock()

            this.intensity = Number intensity

    getColor: ->

        return clone this.color

    setColor: (color) ->

        if not this.getLock()

            if color instanceof THREE.Color

                this.color = color

            else

                this.color = new THREE.Color color

    toggleLock: ->

        this.setLock not this.getLock()

    getLock: ->

        return clone this.lock

    setLock: (lock) ->

        this.lock = Boolean lock
