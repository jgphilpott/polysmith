class Ticks

    constructor : () ->

        @active = null

        @xy = []
        @xz = []
        @yz = []

    add : (min = -scale, max = scale) ->

        if not this.active

            this.active = true

            this.addXY min, max
            this.addXZ min, max
            this.addYZ min, max

    remove : () ->

        if this.active

            this.active = false

            this.removeXY()
            this.removeXZ()
            this.removeYZ()

    addXY : (min = -scale, max = scale) ->

        if this.xy.length is 0 and settings.getSetting "axes", "xyPlane"

            step = settings.getSetting "axes", "xyPlaneStep"

            for tick in [step...max] by step

                xTickPositive = new Line vertices: [[min, tick, 0], [max, tick, 0]]
                xTickNegative = new Line vertices: [[min, -tick, 0], [max, -tick, 0]]
                yTickPositive = new Line vertices: [[tick, min, 0], [tick, max, 0]]
                yTickNegative = new Line vertices: [[-tick, min, 0], [-tick, max, 0]]

                this.xy.push xTickPositive, xTickNegative, yTickPositive, yTickNegative
                scene.add xTickPositive, xTickNegative, yTickPositive, yTickNegative

            xTick = new Line vertices: [[min, 0, 0], [max, 0, 0]]
            yTick = new Line vertices: [[0, min, 0], [0, max, 0]]

            this.xy.push xTick, yTick
            scene.add xTick, yTick

    removeXY : () ->

        if this.xy.length isnt 0

            for tick in this.xy

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xy = []

    addXZ : (min = -scale, max = scale) ->

        if this.xz.length is 0 and settings.getSetting "axes", "xzPlane"

            step = settings.getSetting "axes", "xzPlaneStep"

            for tick in [step...max] by step

                xTickPositive = new Line vertices: [[min, 0, tick], [max, 0, tick]]
                xTickNegative = new Line vertices: [[min, 0, -tick], [max, 0, -tick]]
                zTickPositive = new Line vertices: [[tick, 0, min], [tick, 0, max]]
                zTickNegative = new Line vertices: [[-tick, 0, min], [-tick, 0, max]]

                this.xz.push xTickPositive, xTickNegative, zTickPositive, zTickNegative
                scene.add xTickPositive, xTickNegative, zTickPositive, zTickNegative

            xTick = new Line vertices: [[min, 0, 0], [max, 0, 0]]
            zTick = new Line vertices: [[0, 0, min], [0, 0, max]]

            this.xz.push xTick, zTick
            scene.add xTick, zTick

    removeXZ : () ->

        if this.xz.length isnt 0

            for tick in this.xz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.xz = []

    addYZ : (min = -scale, max = scale) ->

        if this.yz.length is 0 and settings.getSetting "axes", "yzPlane"

            step = settings.getSetting "axes", "yzPlaneStep"

            for tick in [step...max] by step

                yTickPositive = new Line vertices: [[0, min, tick], [0, max, tick]]
                yTickNegative = new Line vertices: [[0, min, -tick], [0, max, -tick]]
                zTickPositive = new Line vertices: [[0, tick, min], [0, tick, max]]
                zTickNegative = new Line vertices: [[0, -tick, min], [0, -tick, max]]

                this.yz.push yTickPositive, yTickNegative, zTickPositive, zTickNegative
                scene.add yTickPositive, yTickNegative, zTickPositive, zTickNegative

            yTick = new Line vertices: [[0, min, 0], [0, max, 0]]
            zTick = new Line vertices: [[0, 0, min], [0, 0, max]]

            this.yz.push yTick, zTick
            scene.add yTick, zTick

    removeYZ : () ->

        if this.yz.length isnt 0

            for tick in this.yz

                tick.geometry.dispose()
                tick.material.dispose()

                scene.remove tick

            this.yz = []
