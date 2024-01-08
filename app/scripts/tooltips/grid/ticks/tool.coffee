class Ticks

    constructor: ->

        @active = null

        @xyStep = settings.get "tooltips.grid.ticks.step.xy"
        @xzStep = settings.get "tooltips.grid.ticks.step.xz"
        @yzStep = settings.get "tooltips.grid.ticks.step.yz"

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

        defaults = settings.tooltips.defaults().grid.ticks

        settings.set "tooltips.grid.ticks.xy", defaults.xy
        settings.set "tooltips.grid.ticks.xz", defaults.xz
        settings.set "tooltips.grid.ticks.yz", defaults.yz

        settings.set "tooltips.grid.ticks.step.xy", defaults.step.xy
        settings.set "tooltips.grid.ticks.step.xz", defaults.step.xz
        settings.set "tooltips.grid.ticks.step.yz", defaults.step.yz

    refresh: ->

        this.remove()
        this.add()

    getStepXY: ->

        return adaptor "convert", "length", clone this.xyStep

    setStepXY: (step, save = true) ->

        this.removeXY false

        this.xyStep = adaptor "invert", "length", step

        this.addXY printer.getSizeX(), printer.getSizeY(), false

        if save then settings.set "tooltips.grid.ticks.step.xy", this.xyStep

    getStepXZ: ->

        return adaptor "convert", "length", clone this.xzStep

    setStepXZ: (step, save = true) ->

        this.removeXZ false

        this.xzStep = adaptor "invert", "length", step

        this.addXZ printer.getSizeX(), printer.getSizeZ(), false

        if save then settings.set "tooltips.grid.ticks.step.xz", this.xzStep

    getStepYZ: ->

        return adaptor "convert", "length", clone this.yzStep

    setStepYZ: (step, save = true) ->

        this.removeYZ false

        this.yzStep = adaptor "invert", "length", step

        this.addYZ printer.getSizeY(), printer.getSizeZ(), false

        if save then settings.set "tooltips.grid.ticks.step.yz", this.yzStep

    addXY: (xSize = printer.getSizeX(), ySize = printer.getSizeY(), save = true) ->

        if this.xy.length is 0 and settings.get "tooltips.grid.ticks.xy"

            step =  this.getStepXY()

            for tick in [step...ySize / 2] by step

                xTickPositive = new Line vertices: [[-xSize / 2, tick, 0], [xSize / 2, tick, 0]], panel: false
                xTickNegative = new Line vertices: [[-xSize / 2, -tick, 0], [xSize / 2, -tick, 0]], panel: false

                this.xy.push xTickPositive, xTickNegative
                scene.add xTickPositive, xTickNegative

            for tick in [step...xSize / 2] by step

                yTickPositive = new Line vertices: [[tick, -ySize / 2, 0], [tick, ySize / 2, 0]], panel: false
                yTickNegative = new Line vertices: [[-tick, -ySize / 2, 0], [-tick, ySize / 2, 0]], panel: false

                this.xy.push yTickPositive, yTickNegative
                scene.add yTickPositive, yTickNegative

            xTick = new Line vertices: [[-xSize / 2, 0, 0], [xSize / 2, 0, 0]], panel: false
            yTick = new Line vertices: [[0, -ySize / 2, 0], [0, ySize / 2, 0]], panel: false

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

            step = this.getStepXZ()

            for tick in [step...zSize / 2] by step

                xTickPositive = new Line vertices: [[-xSize / 2, 0, tick], [xSize / 2, 0, tick]], panel: false
                xTickNegative = new Line vertices: [[-xSize / 2, 0, -tick], [xSize / 2, 0, -tick]], panel: false

                this.xz.push xTickPositive, xTickNegative
                scene.add xTickPositive, xTickNegative

            for tick in [step...xSize / 2] by step

                zTickPositive = new Line vertices: [[tick, 0, -zSize / 2], [tick, 0, zSize / 2]], panel: false
                zTickNegative = new Line vertices: [[-tick, 0, -zSize / 2], [-tick, 0, zSize / 2]], panel: false

                this.xz.push zTickPositive, zTickNegative
                scene.add zTickPositive, zTickNegative

            xTick = new Line vertices: [[-xSize / 2, 0, 0], [xSize / 2, 0, 0]], panel: false
            zTick = new Line vertices: [[0, 0, -zSize / 2], [0, 0, zSize / 2]], panel: false

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

            step = this.getStepYZ()

            for tick in [step...zSize / 2] by step

                yTickPositive = new Line vertices: [[0, -ySize / 2, tick], [0, ySize / 2, tick]], panel: false
                yTickNegative = new Line vertices: [[0, -ySize / 2, -tick], [0, ySize / 2, -tick]], panel: false

                this.yz.push yTickPositive, yTickNegative
                scene.add yTickPositive, yTickNegative

            for tick in [step...ySize / 2] by step

                zTickPositive = new Line vertices: [[0, tick, -zSize / 2], [0, tick, zSize / 2]], panel: false
                zTickNegative = new Line vertices: [[0, -tick, -zSize / 2], [0, -tick, zSize / 2]], panel: false

                this.yz.push zTickPositive, zTickNegative
                scene.add zTickPositive, zTickNegative

            yTick = new Line vertices: [[0, -ySize / 2, 0], [0, ySize / 2, 0]], panel: false
            zTick = new Line vertices: [[0, 0, -zSize / 2], [0, 0, zSize / 2]], panel: false

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
