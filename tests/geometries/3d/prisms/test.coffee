polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 60
    camera.setPosition x: 100, y: 100, z: 100

    triangularPrism = new TriangularPrism name: "Triangular Prism", position: x: 0, y: 0, z: 0
    rectangularPrism = new RectangularPrism name: "Rectangular Prism", position: x: 0, y: 0, z: 15
    pentagonalPrism = new PentagonalPrism name: "Pentagonal Prism", position: x: 0, y: 0, z: 30
    hexagonalPrism = new HexagonalPrism name: "Hexagonal Prism", position: x: 0, y: 0, z: 45
    heptagonalPrism = new HeptagonalPrism name: "Heptagonal Prism", position: x: 0, y: 0, z: 60
    octagonalPrism = new OctagonalPrism name: "Octagonal Prism", position: x: 0, y: 0, z: 75
    nonagonalPrism = new NonagonalPrism name: "Nonagonal Prism", position: x: 0, y: 0, z: 90
    decagonalPrism = new DecagonalPrism name: "Decagonal Prism", position: x: 0, y: 0, z: 105
    cylindricalPrism = new CylindricalPrism name: "Cylindrical Prism", position: x: 0, y: 0, z: 120

    log triangularPrism.geometry
    log rectangularPrism.geometry
    log pentagonalPrism.geometry
    log hexagonalPrism.geometry
    log heptagonalPrism.geometry
    log octagonalPrism.geometry
    log nonagonalPrism.geometry
    log decagonalPrism.geometry
    log cylindricalPrism.geometry

    triangularPrism.add()
    rectangularPrism.add()
    pentagonalPrism.add()
    hexagonalPrism.add()
    heptagonalPrism.add()
    octagonalPrism.add()
    nonagonalPrism.add()
    decagonalPrism.add()
    cylindricalPrism.add()

    log "### Bounding Sphere Tests ###"

    log triangularPrism.geometry.getBoundingSphere()
    log rectangularPrism.geometry.getBoundingSphere()
    log pentagonalPrism.geometry.getBoundingSphere()
    log hexagonalPrism.geometry.getBoundingSphere()
    log heptagonalPrism.geometry.getBoundingSphere()
    log octagonalPrism.geometry.getBoundingSphere()
    log nonagonalPrism.geometry.getBoundingSphere()
    log decagonalPrism.geometry.getBoundingSphere()
    log cylindricalPrism.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log triangularPrism.geometry.getBoundingBox()
    log rectangularPrism.geometry.getBoundingBox()
    log pentagonalPrism.geometry.getBoundingBox()
    log hexagonalPrism.geometry.getBoundingBox()
    log heptagonalPrism.geometry.getBoundingBox()
    log octagonalPrism.geometry.getBoundingBox()
    log nonagonalPrism.geometry.getBoundingBox()
    log decagonalPrism.geometry.getBoundingBox()
    log cylindricalPrism.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log triangularPrism.geometry.getBuffer()
    log rectangularPrism.geometry.getBuffer()
    log pentagonalPrism.geometry.getBuffer()
    log hexagonalPrism.geometry.getBuffer()
    log heptagonalPrism.geometry.getBuffer()
    log octagonalPrism.geometry.getBuffer()
    log nonagonalPrism.geometry.getBuffer()
    log decagonalPrism.geometry.getBuffer()
    log cylindricalPrism.geometry.getBuffer()

    log triangularPrism.geometry.fromBuffer()
    log rectangularPrism.geometry.fromBuffer()
    log pentagonalPrism.geometry.fromBuffer()
    log hexagonalPrism.geometry.fromBuffer()
    log heptagonalPrism.geometry.fromBuffer()
    log octagonalPrism.geometry.fromBuffer()
    log nonagonalPrism.geometry.fromBuffer()
    log decagonalPrism.geometry.fromBuffer()
    log cylindricalPrism.geometry.fromBuffer()

    log triangularPrism.geometry.toBuffer()
    log rectangularPrism.geometry.toBuffer()
    log pentagonalPrism.geometry.toBuffer()
    log hexagonalPrism.geometry.toBuffer()
    log heptagonalPrism.geometry.toBuffer()
    log octagonalPrism.geometry.toBuffer()
    log nonagonalPrism.geometry.toBuffer()
    log decagonalPrism.geometry.toBuffer()
    log cylindricalPrism.geometry.toBuffer()

    log "### Surface Tests ###"

    log triangularPrism.geometry.getSurface()
    log rectangularPrism.geometry.getSurface()
    log pentagonalPrism.geometry.getSurface()
    log hexagonalPrism.geometry.getSurface()
    log heptagonalPrism.geometry.getSurface()
    log octagonalPrism.geometry.getSurface()
    log nonagonalPrism.geometry.getSurface()
    log decagonalPrism.geometry.getSurface()
    log cylindricalPrism.geometry.getSurface()

    log "### Volume Tests ###"

    log triangularPrism.geometry.getVolume()
    log rectangularPrism.geometry.getVolume()
    log pentagonalPrism.geometry.getVolume()
    log hexagonalPrism.geometry.getVolume()
    log heptagonalPrism.geometry.getVolume()
    log octagonalPrism.geometry.getVolume()
    log nonagonalPrism.geometry.getVolume()
    log decagonalPrism.geometry.getVolume()
    log cylindricalPrism.geometry.getVolume()
