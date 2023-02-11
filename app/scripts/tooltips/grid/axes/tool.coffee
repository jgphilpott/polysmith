class Axes

    constructor: ->

        @active = null

        @x = null
        @y = null
        @z = null

    add: ->

        if not this.active

            this.active = true

            this.addX()
            this.addY()
            this.addZ()

    remove: ->

        if this.active

            this.active = false

            this.removeX()
            this.removeY()
            this.removeZ()

    addX: (size = settings.get "printer.size.x") ->

        if not this.x and settings.get "tooltips.grid.axes.x"

            this.x = new Stroke vertices: [[-size / 2, 0, 0], [size / 2, 0, 0]], linewidth: 3, color: redThree

            scene.add this.x

    removeX: ->

        if this.x

            this.x.geometry.dispose()
            this.x.material.dispose()

            scene.remove this.x

            this.x = null

    addY: (size = settings.get "printer.size.y") ->

        if not this.y and settings.get "tooltips.grid.axes.y"

            this.y = new Stroke vertices: [[0, -size / 2, 0], [0, size / 2, 0]], linewidth: 3, color: greenThree

            scene.add this.y

    removeY: ->

        if this.y

            this.y.geometry.dispose()
            this.y.material.dispose()

            scene.remove this.y

            this.y = null

    addZ: (size = settings.get "printer.size.z") ->

        if not this.z and settings.get "tooltips.grid.axes.z"

            this.z = new Stroke vertices: [[0, 0, -size / 2], [0, 0, size / 2]], linewidth: 3, color: blueThree

            scene.add this.z

    removeZ: ->

        if this.z

            this.z.geometry.dispose()
            this.z.material.dispose()

            scene.remove this.z

            this.z = null
