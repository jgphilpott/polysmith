class Light

    constructor : (type, intensity = 1, colorOne = whiteThree, colorTwo = blackThree) ->

        @type = type.toLowerCase().trim()
        @intensity = intensity

        @colorOne = colorOne
        @colorTwo = colorTwo

        switch this.type

            when "ambient"

                @light = new AmbientLight this.intensity, this.colorOne

            when "directional"

                @light = new DirectionalLight this.intensity, this.colorOne

            when "hemisphere"

                @light = new HemisphereLight this.intensity, this.colorOne, this.colorTwo

            when "point"

                @light = new PointLight this.intensity, this.colorOne

            when "spot"

                @light = new SpotLight this.intensity, this.colorOne

    setX : (x = 0) ->

        this.light.position.x = x

    getX : (self = this) ->

        return self.light.position.x

    setY : (y = 0) ->

        this.light.position.y = y

    getY : (self = this) ->

        return self.light.position.y

    setZ : (z = 0) ->

        this.light.position.z = z

    getZ : (self = this) ->

        return self.light.position.z

    setPosition : (x = 0, y = 0, z = 0) ->

        this.light.position.set x, y, z

    getPosition : (self = this) ->

        return self.light.position

    setIntensity : (intensity = 1) ->

        this.light.intensity = intensity

    getIntensity : (self = this) ->

        return self.light.intensity

    add : (self = this) ->

        scene.add self.light

        lights.push self.light

    remove : (self = this) ->

        scene.remove self.light

        lights.filterInPlace (light) -> light.uuid != self.light.uuid
