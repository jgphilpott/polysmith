class Ticks

    constructor: ->

        @active = null

        @xy = []
        @xz = []
        @yz = []

    add: (save = false) ->

        if not this.active

            this.active = true

            this.addXY printer.getSizeX(), printer.getSizeY(), save
            this.addXZ printer.getSizeX(), printer.getSizeZ(), save
            this.addYZ printer.getSizeY(), printer.getSizeZ(), save

    remove: (save = false) ->

        if this.active

            this.active = false

            this.removeXY save
            this.removeXZ save
            this.removeYZ save

    reset: ->

        this.remove()
        this.add()

    addXY: (xSize = printer.getSizeX(), ySize = printer.getSizeY(), save = true) ->

        if this.xy.length is 0 and settings.get "tooltips.grid.ticks.xy"

            step = settings.get "tooltips.grid.ticks.step.xy"

            xSize = adaptor "invert", "length", xSize
            ySize = adaptor "invert", "length", ySize

            for tick in [step...ySize / 2] by step

                xTickPositive = new Line vertices: [[-xSize / 2, tick, 0], [xSize / 2, tick, 0]]
                xTickNegative = new Line vertices: [[-xSize / 2, -tick, 0], [xSize / 2, -tick, 0]]

                this.xy.push xTickPositive, xTickNegative
                scene.add xTickPositive, xTickNegative

            for tick in [step...xSize / 2] by step

                yTickPositive = new Line vertices: [[tick, -ySize / 2, 0], [tick, ySize / 2, 0]]
                yTickNegative = new Line vertices: [[-tick, -ySize / 2, 0], [-tick, ySize / 2, 0]]

                this.xy.push yTickPositive, yTickNegative
                scene.add yTickPositive, yTickNegative

            xTick = new Line vertices: [[-xSize / 2, 0, 0], [xSize / 2, 0, 0]]
            yTick = new Line vertices: [[0, -ySize / 2, 0], [0, ySize / 2, 0]]

            this.xy.push xTick, yTick
            scene.add xTick, yTick

        if save then settings.set "tooltips.grid.ticks.xy", true

    removeXY: (save = true) ->

        if this.xy.length isnt 0

            for tick in this.xy

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xy = []

        if save then settings.set "tooltips.grid.ticks.xy", false

    addXZ: (xSize = printer.getSizeX(), zSize = printer.getSizeZ(), save = true) ->

        if this.xz.length is 0 and settings.get "tooltips.grid.ticks.xz"

            step = settings.get "tooltips.grid.ticks.step.xz"

            xSize = adaptor "invert", "length", xSize
            zSize = adaptor "invert", "length", zSize

            for tick in [step...zSize / 2] by step

                xTickPositive = new Line vertices: [[-xSize / 2, 0, tick], [xSize / 2, 0, tick]]
                xTickNegative = new Line vertices: [[-xSize / 2, 0, -tick], [xSize / 2, 0, -tick]]

                this.xz.push xTickPositive, xTickNegative
                scene.add xTickPositive, xTickNegative

            for tick in [step...xSize / 2] by step

                zTickPositive = new Line vertices: [[tick, 0, -zSize / 2], [tick, 0, zSize / 2]]
                zTickNegative = new Line vertices: [[-tick, 0, -zSize / 2], [-tick, 0, zSize / 2]]

                this.xz.push zTickPositive, zTickNegative
                scene.add zTickPositive, zTickNegative

            xTick = new Line vertices: [[-xSize / 2, 0, 0], [xSize / 2, 0, 0]]
            zTick = new Line vertices: [[0, 0, -zSize / 2], [0, 0, zSize / 2]]

            this.xz.push xTick, zTick
            scene.add xTick, zTick

        if save then settings.set "tooltips.grid.ticks.xz", true

    removeXZ: (save = true) ->

        if this.xz.length isnt 0

            for tick in this.xz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xz = []

        if save then settings.set "tooltips.grid.ticks.xz", false

    addYZ: (ySize = printer.getSizeY(), zSize = printer.getSizeZ(), save = true) ->

        if this.yz.length is 0 and settings.get "tooltips.grid.ticks.yz"

            step = settings.get "tooltips.grid.ticks.step.yz"

            ySize = adaptor "invert", "length", ySize
            zSize = adaptor "invert", "length", zSize

            for tick in [step...zSize / 2] by step

                yTickPositive = new Line vertices: [[0, -ySize / 2, tick], [0, ySize / 2, tick]]
                yTickNegative = new Line vertices: [[0, -ySize / 2, -tick], [0, ySize / 2, -tick]]

                this.yz.push yTickPositive, yTickNegative
                scene.add yTickPositive, yTickNegative

            for tick in [step...ySize / 2] by step

                zTickPositive = new Line vertices: [[0, tick, -zSize / 2], [0, tick, zSize / 2]]
                zTickNegative = new Line vertices: [[0, -tick, -zSize / 2], [0, -tick, zSize / 2]]

                this.yz.push zTickPositive, zTickNegative
                scene.add zTickPositive, zTickNegative

            yTick = new Line vertices: [[0, -ySize / 2, 0], [0, ySize / 2, 0]]
            zTick = new Line vertices: [[0, 0, -zSize / 2], [0, 0, zSize / 2]]

            this.yz.push yTick, zTick
            scene.add yTick, zTick

        if save then settings.set "tooltips.grid.ticks.yz", true

    removeYZ: (save = true) ->

        if this.yz.length isnt 0

            for tick in this.yz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.yz = []

        if save then settings.set "tooltips.grid.ticks.yz", false
