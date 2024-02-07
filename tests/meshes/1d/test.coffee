polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: -42, y: 42, z: 42

    dashed = new Line name: "Dashed", material: "dashed", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 20, 10], [-10, 0, -10]]
    solid = new Line name: "Solid", material: "solid", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 0, 10], [-10, -20, -10]]
    stroke = new Stroke name: "Stroke", material: "stroke", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 10, 10], [-10, -10, -10]]

    log dashed
    log solid
    log stroke

    dashed.add()
    solid.add()
    stroke.add()

    log "### Color Tests ###"

    lineColorTest1 = redThree
    lineColorTest2 = "#FFBF00"
    lineColorTest3 = "green"

    lineColorTest = lineColorTest1

    log dashed.getColor()
    log solid.getColor()
    log stroke.getColor()

    dashed.setColor lineColorTest
    solid.setColor lineColorTest
    stroke.setColor lineColorTest

    log "### Transparent Tests ###"

    lineTransparentTest1 = true
    lineTransparentTest2 = false

    lineTransparentTest = lineTransparentTest1

    log dashed.getTransparent()
    log solid.getTransparent()
    log stroke.getTransparent()

    dashed.setTransparent lineTransparentTest
    solid.setTransparent lineTransparentTest
    stroke.setTransparent lineTransparentTest

    log "### Opacity Tests ###"

    lineOpacityTest1 = 100
    lineOpacityTest2 = 50
    lineOpacityTest3 = 0

    lineOpacityTest = lineOpacityTest1

    log dashed.getOpacity()
    log solid.getOpacity()
    log stroke.getOpacity()

    dashed.setOpacity lineOpacityTest
    solid.setOpacity lineOpacityTest
    stroke.setOpacity lineOpacityTest

    log "### Linewidth Tests ###"

    lineWidthTest1 = 1
    lineWidthTest2 = "2"

    lineWidthTest = lineWidthTest1

    log dashed.getLinewidth()
    log solid.getLinewidth()
    log stroke.getLinewidth()

    dashed.setLinewidth lineWidthTest
    solid.setLinewidth lineWidthTest
    stroke.setLinewidth lineWidthTest

    log "### Dashed Tests ###"

    lineDashedTest1 = true
    lineDashedTest2 = false

    lineDashedTest = lineDashedTest1

    log dashed.getDashed()
    log solid.getDashed()
    log stroke.getDashed()

    dashed.setDashed lineDashedTest
    solid.setDashed lineDashedTest
    stroke.setDashed lineDashedTest

    log "### Dash Size Tests ###"

    lineDashSizeTest1 = 1
    lineDashSizeTest2 = "2"

    lineDashSizeTest = lineDashSizeTest1

    log dashed.getDashSize()
    log solid.getDashSize()
    log stroke.getDashSize()

    dashed.setDashSize lineDashSizeTest
    solid.setDashSize lineDashSizeTest
    stroke.setDashSize lineDashSizeTest

    log "### Gap Size Tests ###"

    lineGapSizeTest1 = 1
    lineGapSizeTest2 = "2"

    lineGapSizeTest = lineGapSizeTest1

    log dashed.getGapSize()
    log solid.getGapSize()
    log stroke.getGapSize()

    dashed.setGapSize lineGapSizeTest
    solid.setGapSize lineGapSizeTest
    stroke.setGapSize lineGapSizeTest

    log "### Distance Tests ###"

    log dashed.getDistance()
    log solid.getDistance()
    log stroke.getDistance()

    log "### Bounding Sphere Tests ###"

    log dashed.getBoundingSphere()
    log solid.getBoundingSphere()
    log stroke.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log dashed.getBoundingBox()
    log solid.getBoundingBox()
    log stroke.getBoundingBox()

    log "### Vertices Tests ###"

    log dashed.getVertices()
    log solid.getVertices()
    log stroke.getVertices()

    dashed.setVertices [[20, 30, 20], [-20, -10, -20]]
    solid.setVertices [[20, 10, 20], [-20, -30, -20]]
    stroke.setVertices [[20, 20, 20], [-20, -20, -20]]

    log "### Type Tests ###"

    lineTypeTest1 = "line"
    lineTypeTest2 = "stroke"

    lineTypeTest = lineTypeTest1

    log dashed.getType()
    log solid.getType()
    log stroke.getType()

    dashed.setType lineTypeTest
    solid.setType lineTypeTest
    stroke.setType lineTypeTest
