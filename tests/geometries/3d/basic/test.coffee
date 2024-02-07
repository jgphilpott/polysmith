polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    box = new Box name: "Box", position: x: 0, y: 0, z: 15
    cylinder = new Cylinder name: "Cylinder", position: x: 0, y: 0, z: 0
    sphere = new Sphere name: "Sphere", position: x: 0, y: 0, z: -15

    log box.geometry
    log cylinder.geometry
    log sphere.geometry

    box.add()
    cylinder.add()
    sphere.add()

    log "### Bounding Sphere Tests ###"

    log box.geometry.getBoundingSphere()
    log cylinder.geometry.getBoundingSphere()
    log sphere.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log box.geometry.getBoundingBox()
    log cylinder.geometry.getBoundingBox()
    log sphere.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log box.geometry.getBuffer()
    log cylinder.geometry.getBuffer()
    log sphere.geometry.getBuffer()

    log box.geometry.fromBuffer()
    log cylinder.geometry.fromBuffer()
    log sphere.geometry.fromBuffer()

    log box.geometry.toBuffer()
    log cylinder.geometry.toBuffer()
    log sphere.geometry.toBuffer()

    log "### Surface Tests ###"

    log box.geometry.getSurface()
    log cylinder.geometry.getSurface()
    log sphere.geometry.getSurface()

    log "### Volume Tests ###"

    log box.geometry.getVolume()
    log cylinder.geometry.getVolume()
    log sphere.geometry.getVolume()
