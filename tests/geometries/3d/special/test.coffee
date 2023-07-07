polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 42
    camera.setPosition x: 100, y: 100, z: 100

    capsule = new Capsule name: "Capsule", position: x: 0, y: 0, z: 0
    image = new Image name: "Image", position: x: 0, y: 0, z: 15
    knot = new Knot name: "Knot", position: x: 0, y: 0, z: 30
    text = new Text name: "Text", position: x: 0, y: 0, z: 45
    torus = new Torus name: "Torus", position: x: 0, y: 0, z: 60
    tube = new Tube name: "Tube", position: x: 0, y: 0, z: 75

    await sleep 1000

    log capsule.geometry
    log image.geometry
    log knot.geometry
    log text.geometry
    log torus.geometry
    log tube.geometry

    capsule.add()
    image.add()
    knot.add()
    text.add()
    torus.add()
    tube.add()

    log "### Bounding Sphere Tests ###"

    log capsule.geometry.getBoundingSphere()
    log image.geometry.getBoundingSphere()
    log knot.geometry.getBoundingSphere()
    log text.geometry.getBoundingSphere()
    log torus.geometry.getBoundingSphere()
    log tube.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log capsule.geometry.getBoundingBox()
    log image.geometry.getBoundingBox()
    log knot.geometry.getBoundingBox()
    log text.geometry.getBoundingBox()
    log torus.geometry.getBoundingBox()
    log tube.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log capsule.geometry.getBuffer()
    log image.geometry.getBuffer()
    log knot.geometry.getBuffer()
    log text.geometry.getBuffer()
    log torus.geometry.getBuffer()
    log tube.geometry.getBuffer()

    log capsule.geometry.fromBuffer()
    log image.geometry.fromBuffer()
    log knot.geometry.fromBuffer()
    log text.geometry.fromBuffer()
    log torus.geometry.fromBuffer()
    log tube.geometry.fromBuffer()

    log capsule.geometry.toBuffer()
    log image.geometry.toBuffer()
    log knot.geometry.toBuffer()
    log text.geometry.toBuffer()
    log torus.geometry.toBuffer()
    log tube.geometry.toBuffer()

    log "### Surface Tests ###"

    log capsule.geometry.getSurface()
    log image.geometry.getSurface()
    log knot.geometry.getSurface()
    log text.geometry.getSurface()
    log torus.geometry.getSurface()
    log tube.geometry.getSurface()

    log "### Volume Tests ###"

    log capsule.geometry.getVolume()
    log image.geometry.getVolume()
    log knot.geometry.getVolume()
    log text.geometry.getVolume()
    log torus.geometry.getVolume()
    log tube.geometry.getVolume()
