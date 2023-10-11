class Measurements

    constructor: ->

        return this

    add: (coordinates) ->

        this.remove()

        if settings.get "tooltips.measurements"

            scale = settings.get "scales.scale"
            unit = settings.get "scales.length.unit"
            language = settings.get "general.language"
            detail = settings.get "scales.length.detail"

            xGuidelineCenter = vectorAdaptor "invert", "length", getCenterPoint({x: 0, y: coordinates.y, z: coordinates.z}, {x: coordinates.x, y: coordinates.y, z: coordinates.z})
            yGuidelineCenter = vectorAdaptor "invert", "length", getCenterPoint({x: coordinates.x, y: 0, z: coordinates.z}, {x: coordinates.x, y: coordinates.y, z: coordinates.z})
            zGuidelineCenter = vectorAdaptor "invert", "length", getCenterPoint({x: coordinates.x, y: coordinates.y, z: 0}, {x: coordinates.x, y: coordinates.y, z: coordinates.z})

            xScreenCoordinates = d3$d2 xGuidelineCenter.x, xGuidelineCenter.y, xGuidelineCenter.z
            yScreenCoordinates = d3$d2 yGuidelineCenter.x, yGuidelineCenter.y, yGuidelineCenter.z
            zScreenCoordinates = d3$d2 zGuidelineCenter.x, zGuidelineCenter.y, zGuidelineCenter.z

            measurements = [{axis: "x", value: coordinates.x}, {axis: "y", value: coordinates.y}, {axis: "z", value: coordinates.z}].sort (a, b) -> Math.abs(a.value) - Math.abs(b.value)

            for measurement in measurements

                axis = measurement.axis
                value = measurement.value.round(detail) or 0

                $("body").prepend "<div id='" + axis + "' class='tooltip measurement'><p>" + format(value, "length", unit[scale], detail, detail, language) + "</p></div>"

            xMeasurement = $("body").find("#x.tooltip.measurement")
            yMeasurement = $("body").find("#y.tooltip.measurement")
            zMeasurement = $("body").find("#z.tooltip.measurement")

            xMeasurement.css("width", xMeasurement.css("width")).css("left", xScreenCoordinates.x).css("top", xScreenCoordinates.y)
            yMeasurement.css("width", yMeasurement.css("width")).css("left", yScreenCoordinates.x).css("top", yScreenCoordinates.y)
            zMeasurement.css("width", zMeasurement.css("width")).css("left", zScreenCoordinates.x).css("top", zScreenCoordinates.y)

    remove: ->

        $(".tooltip.measurement").remove()
