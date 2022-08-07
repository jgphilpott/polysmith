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
