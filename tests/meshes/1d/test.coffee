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

    log dashed.setVertices [[20, 30, 20], [-20, -10, -20]]
    log solid.setVertices [[20, 10, 20], [-20, -30, -20]]
    log stroke.setVertices [[20, 20, 20], [-20, -20, -20]]
