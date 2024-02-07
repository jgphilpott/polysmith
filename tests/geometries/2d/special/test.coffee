polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    ring = new Ring name: "Ring", position: x: 0, y: 0, z: 0

    log ring.geometry

    ring.add()

    log "### Bounding Sphere Tests ###"

    log ring.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log ring.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log ring.geometry.getBuffer()

    log ring.geometry.fromBuffer()

    log ring.geometry.toBuffer()

    log "### Surface Tests ###"

    log ring.geometry.getSurface()
