class Axes

    constructor: ->

        @active = null

        @x = null
        @y = null
        @z = null

    add: (save = false) ->

        if not this.active

            this.active = true

            this.addX printer.getSizeX(), save
            this.addY printer.getSizeY(), save
            this.addZ printer.getSizeZ(), save

    remove: (save = false) ->

        if this.active

            this.active = false

            this.removeX save
            this.removeY save
            this.removeZ save

    reset: ->

        defaults = settings.tooltips.defaults().grid.axes

        settings.set "tooltips.grid.axes.x", defaults.x
        settings.set "tooltips.grid.axes.y", defaults.y
        settings.set "tooltips.grid.axes.z", defaults.z

    refresh: ->

        this.remove()
        this.add()

    addX: (size = printer.getSizeX(), save = true) ->

        if not this.x and settings.get "tooltips.grid.axes.x"

            this.x = new Stroke vertices: [[size / 2, 0, 0], [-size / 2, 0, 0]], linewidth: 3, color: redThree

            grid.caps.addCentroid()
            grid.caps.addX()

            scene.add this.x

        if save then settings.set "tooltips.grid.axes.x", true

    removeX: (save = true) ->

        if this.x

            this.x.geometry.dispose()
            this.x.material.dispose()

            if not this.y and not this.z

                grid.caps.removeCentroid()

            grid.caps.removeX()

            scene.remove this.x

            this.x = null

        if save then settings.set "tooltips.grid.axes.x", false

    addY: (size = printer.getSizeY(), save = true) ->

        if not this.y and settings.get "tooltips.grid.axes.y"

            this.y = new Stroke vertices: [[0, size / 2, 0], [0, -size / 2, 0]], linewidth: 3, color: greenThree

            grid.caps.addCentroid()
            grid.caps.addY()

            scene.add this.y

        if save then settings.set "tooltips.grid.axes.y", true

    removeY: (save = true) ->

        if this.y

            this.y.geometry.dispose()
            this.y.material.dispose()

            if not this.x and not this.z

                grid.caps.removeCentroid()

            grid.caps.removeY()

            scene.remove this.y

            this.y = null

        if save then settings.set "tooltips.grid.axes.y", false

    addZ: (size = printer.getSizeZ(), save = true) ->

        if not this.z and settings.get "tooltips.grid.axes.z"

            this.z = new Stroke vertices: [[0, 0, size / 2], [0, 0, -size / 2]], linewidth: 3, color: blueThree

            grid.caps.addCentroid()
            grid.caps.addZ()

            scene.add this.z

        if save then settings.set "tooltips.grid.axes.z", true

    removeZ: (save = true) ->

        if this.z

            this.z.geometry.dispose()
            this.z.material.dispose()

            if not this.x and not this.y

                grid.caps.removeCentroid()

            grid.caps.removeZ()

            scene.remove this.z

            this.z = null

        if save then settings.set "tooltips.grid.axes.z", false
