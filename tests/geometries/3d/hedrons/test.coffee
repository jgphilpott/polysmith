polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    octahedron = new Octahedron name: "Octahedron", position: x: 0, y: 0, z: 15
    dodecahedron = new Dodecahedron name: "Dodecahedron", position: x: 0, y: 0, z: 0
    icosahedron = new Icosahedron name: "Icosahedron", position: x: 0, y: 0, z: -15

    log octahedron.geometry
    log dodecahedron.geometry
    log icosahedron.geometry

    octahedron.add()
    dodecahedron.add()
    icosahedron.add()

    log "### Bounding Sphere Tests ###"

    log octahedron.geometry.getBoundingSphere()
    log dodecahedron.geometry.getBoundingSphere()
    log icosahedron.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log octahedron.geometry.getBoundingBox()
    log dodecahedron.geometry.getBoundingBox()
    log icosahedron.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log octahedron.geometry.getBuffer()
    log dodecahedron.geometry.getBuffer()
    log icosahedron.geometry.getBuffer()

    log octahedron.geometry.fromBuffer()
    log dodecahedron.geometry.fromBuffer()
    log icosahedron.geometry.fromBuffer()

    log octahedron.geometry.toBuffer()
    log dodecahedron.geometry.toBuffer()
    log icosahedron.geometry.toBuffer()

    log "### Surface Tests ###"

    log octahedron.geometry.getSurface()
    log dodecahedron.geometry.getSurface()
    log icosahedron.geometry.getSurface()

    log "### Volume Tests ###"

    log octahedron.geometry.getVolume()
    log dodecahedron.geometry.getVolume()
    log icosahedron.geometry.getVolume()
