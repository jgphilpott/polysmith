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

        if not this.x and settings.getSetting "axes", "xAxis"

            this.x = new Stroke vertices: [[min, 0, 0], [max, 0, 0]], linewidth: 3, color: redThree

            scene.add this.x

    removeX : () ->

        if this.x

            this.x.geometry.dispose()
            this.x.material.dispose()

            scene.remove this.x

            this.x = null

    addY : (min = -scale, max = scale) ->

        if not this.y and settings.getSetting "axes", "yAxis"

            this.y = new Stroke vertices: [[0, min, 0], [0, max, 0]], linewidth: 3, color: greenThree

            scene.add this.y

    removeY : () ->

        if this.y

            this.y.geometry.dispose()
            this.y.material.dispose()

            scene.remove this.y

            this.y = null

    addZ : (min = -scale, max = scale) ->

        if not this.z and settings.getSetting "axes", "zAxis"

            this.z = new Stroke vertices: [[0, 0, min], [0, 0, max]], linewidth: 3, color: blueThree

            scene.add this.z

    removeZ : () ->

        if this.z

            this.z.geometry.dispose()
            this.z.material.dispose()

            scene.remove this.z

            this.z = null
