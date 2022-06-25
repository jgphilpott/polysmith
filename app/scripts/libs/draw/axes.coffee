addAxes = (min = - scale, max = scale) ->

    if settings.axes.xAxis
        addAxisX min, max
    if settings.axes.yAxis
        addAxisY min, max
    if settings.axes.zAxis
        addAxisZ min, max

    if settings.axes.xyPlane
        addPlaneXY min, max
    if settings.axes.xzPlane
        addPlaneXZ min, max
    if settings.axes.yzPlane
        addPlaneYZ min, max

    if settings.axes.axesCaps
        addAxesCaps min, max

    return axes

removeAxes = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap")

            removeAxisCapEvents axis

        axes.splice index, 1
        scene.remove axis

addAxisX = (min = - scale, max = scale) ->

    if settings.axes.xAxis

        axisX = newLine2 [[min, 0, 0], [max, 0, 0]], "thick", redThree, 3

        axisX.name = "axis-x"

        axes.push axisX
        scene.add axisX

removeAxisX = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-x")

            axes.splice index, 1
            scene.remove axis

addAxisY = (min = - scale, max = scale) ->

    if settings.axes.yAxis

        axisY = newLine2 [[0, min, 0], [0, max, 0]], "thick", greenThree, 3

        axisY.name = "axis-y"

        axes.push axisY
        scene.add axisY

removeAxisY = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-y")

            axes.splice index, 1
            scene.remove axis

addAxisZ = (min = - scale, max = scale) ->

    if settings.axes.zAxis

        axisZ = newLine2 [[0, 0, min], [0, 0, max]], "thick", blueThree, 3

        axisZ.name = "axis-z"

        axes.push axisZ
        scene.add axisZ

removeAxisZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("axis") and axis.name.includes("-z")

            axes.splice index, 1
            scene.remove axis

addPlaneXY = (min = - scale, max = scale) ->

    if settings.axes.xyPlane

        step = settings.axes.xyPlaneStep

        for tick in [step...max] by step

            xTickPositive = newLine [[max, tick, 0], [min, tick, 0]], "basic", blackThree
            xTickNegative = newLine [[max, -tick, 0], [min, -tick, 0]], "basic", blackThree
            yTickPositive = newLine [[tick, max, 0], [tick, min, 0]], "basic", blackThree
            yTickNegative = newLine [[-tick, max, 0], [-tick, min, 0]], "basic", blackThree

            xTickPositive.name = "tick-xy-x-+-" + tick + ""
            xTickNegative.name = "tick-xy-x---" + tick + ""
            yTickPositive.name = "tick-xy-y-+-" + tick + ""
            yTickNegative.name = "tick-xy-y---" + tick + ""

            axes.push xTickPositive, xTickNegative, yTickPositive, yTickNegative
            scene.add xTickPositive, xTickNegative, yTickPositive, yTickNegative

        xTick = newLine [[max, 0, 0], [min, 0, 0]], "basic", blackThree
        yTick = newLine [[0, max, 0], [0, min, 0]], "basic", blackThree

        xTick.name = "tick-xy-x-0"
        yTick.name = "tick-xy-y-0"

        axes.push xTick, yTick
        scene.add xTick, yTick

removePlaneXY = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-xy-")

            axes.splice index, 1
            scene.remove axis

addPlaneXZ = (min = - scale, max = scale) ->

    if settings.axes.xzPlane

        step = settings.axes.xzPlaneStep

        for tick in [step...max] by step

            xTickPositive = newLine [[max, 0, tick], [min, 0, tick]], "basic", blackThree
            xTickNegative = newLine [[max, 0, -tick], [min, 0, -tick]], "basic", blackThree
            zTickPositive = newLine [[tick, 0, max], [tick, 0, min]], "basic", blackThree
            zTickNegative = newLine [[-tick, 0, max], [-tick, 0, min]], "basic", blackThree

            xTickPositive.name = "tick-xz-x-+-" + tick + ""
            xTickNegative.name = "tick-xz-x---" + tick + ""
            zTickPositive.name = "tick-xz-z-+-" + tick + ""
            zTickNegative.name = "tick-xz-z---" + tick + ""

            axes.push xTickPositive, xTickNegative, zTickPositive, zTickNegative
            scene.add xTickPositive, xTickNegative, zTickPositive, zTickNegative

        xTick = newLine [[max, 0, 0], [min, 0, 0]], "basic", blackThree
        zTick = newLine [[0, 0, max], [0, 0, min]], "basic", blackThree

        xTick.name = "tick-xz-x-0"
        zTick.name = "tick-xz-z-0"

        axes.push xTick, zTick
        scene.add xTick, zTick

removePlaneXZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-xz-")

            axes.splice index, 1
            scene.remove axis

addPlaneYZ = (min = - scale, max = scale) ->

    if settings.axes.yzPlane

        step = settings.axes.yzPlaneStep

        for tick in [step...max] by step

            yTickPositive = newLine [[0, max, tick], [0, min, tick]], "basic", blackThree
            yTickNegative = newLine [[0, max, -tick], [0, min, -tick]], "basic", blackThree
            zTickPositive = newLine [[0, tick, max], [0, tick, min]], "basic", blackThree
            zTickNegative = newLine [[0, -tick, max], [0, -tick, min]], "basic", blackThree

            yTickPositive.name = "tick-yz-y-+-" + tick + ""
            yTickNegative.name = "tick-yz-y---" + tick + ""
            zTickPositive.name = "tick-yz-z-+-" + tick + ""
            zTickNegative.name = "tick-yz-z---" + tick + ""

            axes.push yTickPositive, yTickNegative, zTickPositive, zTickNegative
            scene.add yTickPositive, yTickNegative, zTickPositive, zTickNegative

        yTick = newLine [[0, max, 0], [0, min, 0]], "basic", blackThree
        zTick = newLine [[0, 0, max], [0, 0, min]], "basic", blackThree

        yTick.name = "tick-yz-y-0"
        zTick.name = "tick-yz-z-0"

        axes.push yTick, zTick
        scene.add yTick, zTick

removePlaneYZ = () ->

    for axis, index in axes by -1

        if axis.name.includes("tick") and axis.name.includes("-yz-")

            axes.splice index, 1
            scene.remove axis

addAxesCaps = (min = - scale, max = scale) ->

    if settings.axes.axesCaps and (settings.axes.xAxis or settings.axes.yAxis or settings.axes.zAxis)

        if settings.axes.xAxis
            addAxisCapsX min, max
        if settings.axes.yAxis
            addAxisCapsY min, max
        if settings.axes.zAxis
            addAxisCapsZ min, max

        addCentroidCap()

removeAxesCaps = () ->

    for axis, index in axes by -1

        if axis.name.includes("cap")

            removeAxisCapEvents axis

            axes.splice index, 1
            scene.remove axis

addCentroidCap = () ->

    if settings.axes.axesCaps and (settings.axes.xAxis or settings.axes.yAxis or settings.axes.zAxis)

        centroid = newSphere 1, 25, 25, [0, 0, 0], "basic", blackThree

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

addAxisCapsX = (min= - scale, max = scale) ->

    if settings.axes.axesCaps and settings.axes.xAxis

        minCapX = newSphere 1, 25, 25, [min, 0, 0], "basic", redThree
        maxCapX = newSphere 1, 25, 25, [max, 0, 0], "basic", greenThree

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

addAxisCapsY = (min = - scale, max = scale) ->

    if settings.axes.axesCaps and settings.axes.yAxis

        minCapY = newSphere 1, 25, 25, [0, min, 0], "basic", redThree
        maxCapY = newSphere 1, 25, 25, [0, max, 0], "basic", greenThree

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

addAxisCapsZ = (min = - scale, max = scale) ->

    if settings.axes.axesCaps and settings.axes.zAxis

        minCapZ = newSphere 1, 25, 25, [0, 0, min], "basic", redThree
        maxCapZ = newSphere 1, 25, 25, [0, 0, max], "basic", greenThree

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

            $("#canvas").css("cursor", "pointer")

    events.addEventListener cap, "mouseout", (event) ->

        if not events.operation.key

            $("#canvas").css "cursor", ""

    events.addEventListener cap, "mousedown", (event) ->

        event.stopPropagation()

    events.addEventListener cap, "mouseup", (event) ->

        event.stopPropagation()

    events.addEventListener cap, "dblclick", (event) ->

        if focus event.target.position

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
