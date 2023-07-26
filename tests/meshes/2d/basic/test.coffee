polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    circle = new Circle name: "Circle", position: x: 0, y: 0, z: 10
    plane = new Plane name: "Plane", position: x: 0, y: 0, z: -10

    log circle
    log plane

    circle.add()
    plane.add()

    log "### Bounding Sphere Tests ###"

    log circle.getBoundingSphere()
    log plane.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log circle.getBoundingBox()
    log plane.getBoundingBox()

    log "### Buffer Tests ###"

    log circle.getBuffer()
    log plane.getBuffer()

    log circle.fromBuffer()
    log plane.fromBuffer()

    log circle.toBuffer()
    log plane.toBuffer()

    log "### Surface Tests ###"

    log circle.getSurface()
    log plane.getSurface()
