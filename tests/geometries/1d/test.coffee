polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: -42, y: 42, z: 42

    dashed = new Line name: "Dashed", material: "dashed", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 20, 10], [-10, 0, -10]]
    solid = new Line name: "Solid", material: "solid", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 0, 10], [-10, -20, -10]]
    stroke = new Stroke name: "Stroke", material: "stroke", color: blackThree, opacity: 100, linewidth: 5, vertices: [[10, 10, 10], [-10, -10, -10]]

    log dashed.geometry
    log solid.geometry
    log stroke.geometry

    dashed.add()
    solid.add()
    stroke.add()

    log "### Distance Tests ###"

    log dashed.geometry.getDistance()
    log solid.geometry.getDistance()
    log stroke.geometry.getDistance()
