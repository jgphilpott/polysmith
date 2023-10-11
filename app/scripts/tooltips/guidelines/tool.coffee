class Guidelines

    constructor: ->

        @lines = []

        @measurements = new Measurements()

    add: (coordinates) ->

        this.remove()

        if settings.get "tooltips.guidelines"

            xGuideline = new Line vertices: [[0, coordinates.y, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: blackThree
            yGuideline = new Line vertices: [[coordinates.x, 0, coordinates.z], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: blackThree
            zGuideline = new Line vertices: [[coordinates.x, coordinates.y, 0], [coordinates.x, coordinates.y, coordinates.z]], material: "dashed", color: blackThree

            this.lines.push xGuideline, yGuideline, zGuideline
            scene.add xGuideline, yGuideline, zGuideline

            this.measurements.add coordinates

    remove: ->

        this.measurements.remove()

        for line in this.lines

            line.geometry.dispose()
            line.material.dispose()

            scene.remove line

        this.lines = []
