class Axes

    constructor : () ->

        @active = null

        @x = null
        @y = null
        @z = null

    add : (min = -scale, max = scale) ->

        if not this.active

            this.active = true

            this.addX min, max
            this.addY min, max
            this.addZ min, max

    remove : () ->

        if this.active

            this.active = false

            this.removeX()
            this.removeY()
            this.removeZ()

    addX : (min = -scale, max = scale) ->

        if settings.getSetting "axes", "xAxis" and not this.x

            this.x = new Stroke vertices: [[min, 0, 0], [max, 0, 0]], linewidth: 3, color: redThree

            scene.add this.x

    removeX : () ->

        scene.remove this.x

        this.x = null

    addY : (min = -scale, max = scale) ->

        if settings.getSetting "axes", "yAxis" and not this.y

            this.y = new Stroke vertices: [[0, min, 0], [0, max, 0]], linewidth: 3, color: greenThree

            scene.add this.y

    removeY : () ->

        scene.remove this.y

        this.y = null

    addZ : (min = -scale, max = scale) ->

        if settings.getSetting "axes", "zAxis" and not this.z

            this.z = new Stroke vertices: [[0, 0, min], [0, 0, max]], linewidth: 3, color: blueThree

            scene.add this.z

    removeZ : () ->

        scene.remove this.z

        this.z = null
