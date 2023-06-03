polygen = ->

    log "### Setup ###"

    dashed = new Line material: "dashed", linewidth: 5, color: blueThree, vertices: [[10, 20, 10], [-10, 0, -10]]
    solid = new Line material: "solid", linewidth: 5, color: blueThree, vertices: [[10, 0, 10], [-10, -20, -10]]
    stroke = new Stroke material: "stroke", linewidth: 5, color: blueThree, vertices: [[10, 10, 10], [-10, -10, -10]]

    log dashed.material
    log solid.material
    log stroke.material

    dashed.add()
    solid.add()
    stroke.add()

    log "### Color Tests ###"

    log dashed.material.getColor()
    log solid.material.getColor()
    log stroke.material.getColor()

    dashed.material.setColor "#FFBF00"
    solid.material.setColor "#FFBF00"
    stroke.material.setColor "#FFBF00"

    dashed.material.setColor "green"
    solid.material.setColor "green"
    stroke.material.setColor "green"

    dashed.material.setColor redThree
    solid.material.setColor redThree
    stroke.material.setColor redThree

    log "### Opacity Tests ###"

    log dashed.material.getOpacity()
    log solid.material.getOpacity()
    log stroke.material.getOpacity()

    dashed.material.setOpacity 50
    solid.material.setOpacity 50
    stroke.material.setOpacity 50

    log "### Transparent Tests ###"

    log dashed.material.getTransparent()
    log solid.material.getTransparent()
    log stroke.material.getTransparent()

    dashed.material.setTransparent false
    solid.material.setTransparent false
    stroke.material.setTransparent false

    dashed.material.setTransparent true
    solid.material.setTransparent true
    stroke.material.setTransparent true

    log "### Linewidth Tests ###"

    log dashed.material.getLinewidth()
    log solid.material.getLinewidth()
    log stroke.material.getLinewidth()

    dashed.material.setLinewidth "1"
    solid.material.setLinewidth "1"
    stroke.material.setLinewidth "1"

    dashed.material.setLinewidth 10
    solid.material.setLinewidth 10
    stroke.material.setLinewidth 10

    log "### Dashed Tests ###"

    log dashed.material.getDashed()
    log solid.material.getDashed()
    log stroke.material.getDashed()

    dashed.material.setDashed false
    solid.material.setDashed false
    stroke.material.setDashed false

    dashed.material.setDashed true
    solid.material.setDashed true
    stroke.material.setDashed true

    log "### Dash Size Tests ###"

    log dashed.material.getDashSize()
    log solid.material.getDashSize()
    log stroke.material.getDashSize()

    dashed.material.setDashSize 1
    solid.material.setDashSize 1
    stroke.material.setDashSize 1

    log "### Gap Size Tests ###"

    log dashed.material.getGapSize()
    log solid.material.getGapSize()
    log stroke.material.getGapSize()

    dashed.material.setGapSize 1
    solid.material.setGapSize 1
    stroke.material.setGapSize 1

    log "### Resolution Tests ###"

    log stroke.material.getResolution()

    stroke.material.setResolution()
