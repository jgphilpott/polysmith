class Ticks

    constructor: ->

        @active = null

        @xy = []
        @xz = []
        @yz = []

    add: ->

        if not this.active

            this.active = true

            this.addXY()
            this.addXZ()
            this.addYZ()

    remove: ->

        if this.active

            this.active = false

            this.removeXY()
            this.removeXZ()
            this.removeYZ()

    addXY: (xSize = settings.get "printer.size.x", ySize = settings.get "printer.size.y") ->

        if this.xy.length is 0 and settings.get "tooltips.grid.ticks.xy"

            step = settings.get "tooltips.grid.ticks.step.xy"

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

    removeXY: ->

        if this.xy.length isnt 0

            for tick in this.xy

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xy = []

    addXZ: (xSize = settings.get "printer.size.x", zSize = settings.get "printer.size.z") ->

        if this.xz.length is 0 and settings.get "tooltips.grid.ticks.xz"

            step = settings.get "tooltips.grid.ticks.step.xz"

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

    removeXZ: ->

        if this.xz.length isnt 0

            for tick in this.xz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xz = []

    addYZ: (ySize = settings.get "printer.size.y", zSize = settings.get "printer.size.z") ->

        if this.yz.length is 0 and settings.get "tooltips.grid.ticks.yz"

            step = settings.get "tooltips.grid.ticks.step.yz"

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

    removeYZ: ->

        if this.yz.length isnt 0

            for tick in this.yz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.yz = []
