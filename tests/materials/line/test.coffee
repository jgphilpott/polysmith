polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: -42, y: 42, z: 42

    dashed = new Line name: "Dashed", material: "dashed", color: blueThree, opacity: 50, linewidth: 5, vertices: [[10, 20, 10], [-10, 0, -10]]
    solid = new Line name: "Solid", material: "solid", color: blueThree, opacity: 50, linewidth: 5, vertices: [[10, 0, 10], [-10, -20, -10]]
    stroke = new Stroke name: "Stroke", material: "stroke", color: blueThree, opacity: 50, linewidth: 5, vertices: [[10, 10, 10], [-10, -10, -10]]

    log dashed.material
    log solid.material
    log stroke.material

    dashed.add()
    solid.add()
    stroke.add()

    log "### Color Tests ###"

    materialsLineColorTest1 = redThree
    materialsLineColorTest2 = "#FFBF00"
    materialsLineColorTest3 = "green"

    materialsLineColorTest = materialsLineColorTest1

    log dashed.material.getColor()
    log solid.material.getColor()
    log stroke.material.getColor()

    dashed.material.setColor materialsLineColorTest
    solid.material.setColor materialsLineColorTest
    stroke.material.setColor materialsLineColorTest

    log "### Opacity Tests ###"

    materialsLineOpacityTest1 = 100
    materialsLineOpacityTest2 = 50
    materialsLineOpacityTest3 = 0

    materialsLineOpacityTest = materialsLineOpacityTest1

    log dashed.material.getOpacity()
    log solid.material.getOpacity()
    log stroke.material.getOpacity()

    dashed.material.setOpacity materialsLineOpacityTest
    solid.material.setOpacity materialsLineOpacityTest
    stroke.material.setOpacity materialsLineOpacityTest

    log "### Transparent Tests ###"

    materialsLineTransparentTest1 = true
    materialsLineTransparentTest2 = false

    materialsLineTransparentTest = materialsLineTransparentTest1

    log dashed.material.getTransparent()
    log solid.material.getTransparent()
    log stroke.material.getTransparent()

    dashed.material.setTransparent materialsLineTransparentTest
    solid.material.setTransparent materialsLineTransparentTest
    stroke.material.setTransparent materialsLineTransparentTest

    log "### Linewidth Tests ###"

    materialsLineLinewidthTest1 = 10
    materialsLineLinewidthTest2 = "1"

    materialsLineLinewidthTest = materialsLineLinewidthTest1

    log dashed.material.getLinewidth()
    log solid.material.getLinewidth()
    log stroke.material.getLinewidth()

    dashed.material.setLinewidth materialsLineLinewidthTest
    solid.material.setLinewidth materialsLineLinewidthTest
    stroke.material.setLinewidth materialsLineLinewidthTest

    log "### Dashed Tests ###"

    materialsLineDashedTest1 = true
    materialsLineDashedTest2 = false

    materialsLineDashedTest = materialsLineDashedTest1

    log dashed.material.getDashed()
    log solid.material.getDashed()
    log stroke.material.getDashed()

    dashed.material.setDashed materialsLineDashedTest
    solid.material.setDashed materialsLineDashedTest
    stroke.material.setDashed materialsLineDashedTest

    log "### Dash Size Tests ###"

    materialsLineDashSizeTest1 = 1
    materialsLineDashSizeTest2 = "2"

    materialsLineDashSizeTest = materialsLineDashSizeTest1

    log dashed.material.getDashSize()
    log solid.material.getDashSize()
    log stroke.material.getDashSize()

    dashed.material.setDashSize materialsLineDashSizeTest
    solid.material.setDashSize materialsLineDashSizeTest
    stroke.material.setDashSize materialsLineDashSizeTest

    log "### Gap Size Tests ###"

    materialsLineGapSizeTest1 = 1
    materialsLineGapSizeTest2 = "2"

    materialsLineGapSizeTest = materialsLineGapSizeTest1

    log dashed.material.getGapSize()
    log solid.material.getGapSize()
    log stroke.material.getGapSize()

    dashed.material.setGapSize materialsLineGapSizeTest
    solid.material.setGapSize materialsLineGapSizeTest
    stroke.material.setGapSize materialsLineGapSizeTest

    log "### Resolution Tests ###"

    log stroke.material.getResolution()

    stroke.material.setResolution()
