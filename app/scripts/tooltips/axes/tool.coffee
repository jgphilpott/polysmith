addAxes = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "xAxis"
        addAxisX min, max
    if settings.getSetting "axes", "yAxis"
        addAxisY min, max
    if settings.getSetting "axes", "zAxis"
        addAxisZ min, max

    if settings.getSetting "axes", "xyPlane"
        addPlaneXY min, max
    if settings.getSetting "axes", "xzPlane"
        addPlaneXZ min, max
    if settings.getSetting "axes", "yzPlane"
        addPlaneYZ min, max

    if settings.getSetting "axes", "axesCaps"
        addAxesCaps min, max

    return axes

removeAxes = () ->

    for axis, index in axes by -1

        if axis.name.includes "cap"

            removeAxisCapEvents axis

        axes.splice index, 1
        scene.remove axis

addAxisX = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "xAxis"

        axisX = new Stroke vertices: [[min, 0, 0], [max, 0, 0]], linewidth: 3, color: redThree

        axisX.name = "axis-x"

        axes.push axisX
        scene.add axisX

removeAxisX = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-x")

            axes.splice index, 1
            scene.remove axis

addAxisY = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "yAxis"

        axisY = new Stroke vertices: [[0, min, 0], [0, max, 0]], linewidth: 3, color: greenThree

        axisY.name = "axis-y"

        axes.push axisY
        scene.add axisY

removeAxisY = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-y")

            axes.splice index, 1
            scene.remove axis

addAxisZ = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "zAxis"

        axisZ = new Stroke vertices: [[0, 0, min], [0, 0, max]], linewidth: 3, color: blueThree

        axisZ.name = "axis-z"

        axes.push axisZ
        scene.add axisZ

removeAxisZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-z")

            axes.splice index, 1
            scene.remove axis

addPlaneXY = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "xyPlane"

        step = settings.getSetting "axes", "xyPlaneStep"

        for tick in [step...max] by step

            xTickPositive = new Line vertices: [[max, tick, 0], [min, tick, 0]]
            xTickNegative = new Line vertices: [[max, -tick, 0], [min, -tick, 0]]
            yTickPositive = new Line vertices: [[tick, max, 0], [tick, min, 0]]
            yTickNegative = new Line vertices: [[-tick, max, 0], [-tick, min, 0]]

            xTickPositive.name = "tick-xy-x-+-" + tick + ""
            xTickNegative.name = "tick-xy-x---" + tick + ""
            yTickPositive.name = "tick-xy-y-+-" + tick + ""
            yTickNegative.name = "tick-xy-y---" + tick + ""

            axes.push xTickPositive, xTickNegative, yTickPositive, yTickNegative
            scene.add xTickPositive, xTickNegative, yTickPositive, yTickNegative

        xTick = new Line vertices: [[max, 0, 0], [min, 0, 0]]
        yTick = new Line vertices: [[0, max, 0], [0, min, 0]]

        xTick.name = "tick-xy-x-0"
        yTick.name = "tick-xy-y-0"

        axes.push xTick, yTick
        scene.add xTick, yTick

removePlaneXY = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-xy-")

            axes.splice index, 1
            scene.remove axis

addPlaneXZ = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "xzPlane"

        step = settings.getSetting "axes", "xzPlaneStep"

        for tick in [step...max] by step

            xTickPositive = new Line vertices: [[max, 0, tick], [min, 0, tick]]
            xTickNegative = new Line vertices: [[max, 0, -tick], [min, 0, -tick]]
            zTickPositive = new Line vertices: [[tick, 0, max], [tick, 0, min]]
            zTickNegative = new Line vertices: [[-tick, 0, max], [-tick, 0, min]]

            xTickPositive.name = "tick-xz-x-+-" + tick + ""
            xTickNegative.name = "tick-xz-x---" + tick + ""
            zTickPositive.name = "tick-xz-z-+-" + tick + ""
            zTickNegative.name = "tick-xz-z---" + tick + ""

            axes.push xTickPositive, xTickNegative, zTickPositive, zTickNegative
            scene.add xTickPositive, xTickNegative, zTickPositive, zTickNegative

        xTick = new Line vertices: [[max, 0, 0], [min, 0, 0]]
        zTick = new Line vertices: [[0, 0, max], [0, 0, min]]

        xTick.name = "tick-xz-x-0"
        zTick.name = "tick-xz-z-0"

        axes.push xTick, zTick
        scene.add xTick, zTick

removePlaneXZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-xz-")

            axes.splice index, 1
            scene.remove axis

addPlaneYZ = (min = -scale, max = scale) ->

    if settings.getSetting "axes", "yzPlane"

        step = settings.getSetting "axes", "yzPlaneStep"

        for tick in [step...max] by step

            yTickPositive = new Line vertices: [[0, max, tick], [0, min, tick]]
            yTickNegative = new Line vertices: [[0, max, -tick], [0, min, -tick]]
            zTickPositive = new Line vertices: [[0, tick, max], [0, tick, min]]
            zTickNegative = new Line vertices: [[0, -tick, max], [0, -tick, min]]

            yTickPositive.name = "tick-yz-y-+-" + tick + ""
            yTickNegative.name = "tick-yz-y---" + tick + ""
            zTickPositive.name = "tick-yz-z-+-" + tick + ""
            zTickNegative.name = "tick-yz-z---" + tick + ""

            axes.push yTickPositive, yTickNegative, zTickPositive, zTickNegative
            scene.add yTickPositive, yTickNegative, zTickPositive, zTickNegative

        yTick = new Line vertices: [[0, max, 0], [0, min, 0]]
        zTick = new Line vertices: [[0, 0, max], [0, 0, min]]

        yTick.name = "tick-yz-y-0"
        zTick.name = "tick-yz-z-0"

        axes.push yTick, zTick
        scene.add yTick, zTick

removePlaneYZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-yz-")

            axes.splice index, 1
            scene.remove axis

addAxesCaps = (min = -scale, max = scale) ->

    if settings.getSetting("axes", "axesCaps") and (settings.getSetting("axes", "xAxis") or settings.getSetting("axes", "yAxis") or settings.getSetting("axes", "zAxis"))

        if settings.getSetting "axes", "xAxis"
            addAxisCapsX min, max
        if settings.getSetting "axes", "yAxis"
            addAxisCapsY min, max
        if settings.getSetting "axes", "zAxis"
            addAxisCapsZ min, max

        addCentroidCap()

removeAxesCaps = () ->

    for axis, index in axes by -1

        if axis.name.includes "cap"

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addCentroidCap = () ->

    if settings.getSetting("axes", "axesCaps") and (settings.getSetting("axes", "xAxis") or settings.getSetting("axes", "yAxis") or settings.getSetting("axes", "zAxis"))

        centroid = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: 0, y: 0, z: 0}, material: "basic", color: blackThree

        centroid.name = "centroid-cap"

        addAxisCapEvents centroid

        axes.push centroid
        scene.add centroid

removeCentroidCap = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap") and axis.name.includes("centroid")

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addAxisCapsX = (min= -scale, max = scale) ->

    if settings.getSetting("axes", "axesCaps") and settings.getSetting("axes", "xAxis")

        minCapX = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: min, y: 0, z: 0}, material: "basic", color: redThree
        maxCapX = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: max, y: 0, z: 0}, material: "basic", color: greenThree

        minCapX.name = "min-cap-x"
        maxCapX.name = "max-cap-x"

        addAxisCapEvents minCapX
        addAxisCapEvents maxCapX

        axes.push minCapX, maxCapX
        scene.add minCapX, maxCapX

removeAxisCapsX = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap") and axis.name.includes("-x")

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addAxisCapsY = (min = -scale, max = scale) ->

    if settings.getSetting("axes", "axesCaps") and settings.getSetting("axes", "yAxis")

        minCapY = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: 0, y: min, z: 0}, material: "basic", color: redThree
        maxCapY = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: 0, y: max, z: 0}, material: "basic", color: greenThree

        minCapY.name = "min-cap-y"
        maxCapY.name = "max-cap-y"

        addAxisCapEvents minCapY
        addAxisCapEvents maxCapY

        axes.push minCapY, maxCapY
        scene.add minCapY, maxCapY

removeAxisCapsY = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap") and axis.name.includes("-y")

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addAxisCapsZ = (min = -scale, max = scale) ->

    if settings.getSetting("axes", "axesCaps") and settings.getSetting("axes", "zAxis")

        minCapZ = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: 0, y: 0, z: min}, material: "basic", color: redThree
        maxCapZ = new Sphere radius: 1, widthSegments: 25, heightSegments: 25, position: {x: 0, y: 0, z: max}, material: "basic", color: greenThree

        minCapZ.name = "min-cap-z"
        maxCapZ.name = "max-cap-z"

        addAxisCapEvents minCapZ
        addAxisCapEvents maxCapZ

        axes.push minCapZ, maxCapZ
        scene.add minCapZ, maxCapZ

removeAxisCapsZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap") and axis.name.includes("-z")

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addAxisCapEvents = (cap) ->

    events.addEventListener cap, "mouseover", (event) ->

        if not events.operation.key

            $("#canvas").css "cursor", "pointer"

    events.addEventListener cap, "mouseout", (event) ->

        if not events.operation.key

            $("#canvas").css "cursor", ""

    events.addEventListener cap, "mousedown", (event) ->

        event.stopPropagation()

    events.addEventListener cap, "mouseup", (event) ->

        event.stopPropagation()

    events.addEventListener cap, "dblclick", (event) ->

        if camera.focus event.target.position

            $("#canvas").css "cursor", ""

    events.addEventListener cap, "contextmenu", (event) ->

        contextMenu "axisCap", cap, event.origDomEvent

removeAxisCapEvents = (cap) ->

    events.removeEventListener cap, "mouseover"
    events.removeEventListener cap, "mouseout"
    events.removeEventListener cap, "mousedown"
    events.removeEventListener cap, "mouseup"
    events.removeEventListener cap, "dblclick"
    events.removeEventListener cap, "contextmenu"
