polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    circle = new Circle name: "Circle", position: x: 0, y: 0, z: 10
    plane = new Plane name: "Plane", position: x: 0, y: 0, z: -10

    log circle.geometry
    log plane.geometry

    circle.add()
    plane.add()

    log "### Buffer Tests ###"

    log circle.geometry.getBuffer()
    log plane.geometry.getBuffer()

    log circle.geometry.fromBuffer()
    log plane.geometry.fromBuffer()

    log circle.geometry.toBuffer()
    log plane.geometry.toBuffer()

    log "### Surface Tests ###"

    log circle.geometry.getSurface()
    log plane.geometry.getSurface()

    log circle.geometry.setSurface()
    log plane.geometry.setSurface()
