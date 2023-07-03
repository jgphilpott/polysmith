polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 60
    camera.setPosition x: 100, y: 100, z: 100

    triangularPyramid = new TriangularPyramid name: "Triangular Pyramid", position: x: 0, y: 0, z: 0
    rectangularPyramid = new RectangularPyramid name: "Rectangular Pyramid", position: x: 0, y: 0, z: 15
    pentagonalPyramid = new PentagonalPyramid name: "Pentagonal Pyramid", position: x: 0, y: 0, z: 30
    hexagonalPyramid = new HexagonalPyramid name: "Hexagonal Pyramid", position: x: 0, y: 0, z: 45
    heptagonalPyramid = new HeptagonalPyramid name: "Heptagonal Pyramid", position: x: 0, y: 0, z: 60
    octagonalPyramid = new OctagonalPyramid name: "Octagonal Pyramid", position: x: 0, y: 0, z: 75
    nonagonalPyramid = new NonagonalPyramid name: "Nonagonal Pyramid", position: x: 0, y: 0, z: 90
    decagonalPyramid = new DecagonalPyramid name: "Decagonal Pyramid", position: x: 0, y: 0, z: 105
    cone = new Cone name: "Cone", position: x: 0, y: 0, z: 120

    log triangularPyramid.geometry
    log rectangularPyramid.geometry
    log pentagonalPyramid.geometry
    log hexagonalPyramid.geometry
    log heptagonalPyramid.geometry
    log octagonalPyramid.geometry
    log nonagonalPyramid.geometry
    log decagonalPyramid.geometry
    log cone.geometry

    triangularPyramid.add()
    rectangularPyramid.add()
    pentagonalPyramid.add()
    hexagonalPyramid.add()
    heptagonalPyramid.add()
    octagonalPyramid.add()
    nonagonalPyramid.add()
    decagonalPyramid.add()
    cone.add()

    log "### Bounding Sphere Tests ###"

    log triangularPyramid.geometry.getBoundingSphere()
    log rectangularPyramid.geometry.getBoundingSphere()
    log pentagonalPyramid.geometry.getBoundingSphere()
    log hexagonalPyramid.geometry.getBoundingSphere()
    log heptagonalPyramid.geometry.getBoundingSphere()
    log octagonalPyramid.geometry.getBoundingSphere()
    log nonagonalPyramid.geometry.getBoundingSphere()
    log decagonalPyramid.geometry.getBoundingSphere()
    log cone.geometry.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log triangularPyramid.geometry.getBoundingBox()
    log rectangularPyramid.geometry.getBoundingBox()
    log pentagonalPyramid.geometry.getBoundingBox()
    log hexagonalPyramid.geometry.getBoundingBox()
    log heptagonalPyramid.geometry.getBoundingBox()
    log octagonalPyramid.geometry.getBoundingBox()
    log nonagonalPyramid.geometry.getBoundingBox()
    log decagonalPyramid.geometry.getBoundingBox()
    log cone.geometry.getBoundingBox()

    log "### Buffer Tests ###"

    log triangularPyramid.geometry.getBuffer()
    log rectangularPyramid.geometry.getBuffer()
    log pentagonalPyramid.geometry.getBuffer()
    log hexagonalPyramid.geometry.getBuffer()
    log heptagonalPyramid.geometry.getBuffer()
    log octagonalPyramid.geometry.getBuffer()
    log nonagonalPyramid.geometry.getBuffer()
    log decagonalPyramid.geometry.getBuffer()
    log cone.geometry.getBuffer()

    log triangularPyramid.geometry.fromBuffer()
    log rectangularPyramid.geometry.fromBuffer()
    log pentagonalPyramid.geometry.fromBuffer()
    log hexagonalPyramid.geometry.fromBuffer()
    log heptagonalPyramid.geometry.fromBuffer()
    log octagonalPyramid.geometry.fromBuffer()
    log nonagonalPyramid.geometry.fromBuffer()
    log decagonalPyramid.geometry.fromBuffer()
    log cone.geometry.fromBuffer()

    log triangularPyramid.geometry.toBuffer()
    log rectangularPyramid.geometry.toBuffer()
    log pentagonalPyramid.geometry.toBuffer()
    log hexagonalPyramid.geometry.toBuffer()
    log heptagonalPyramid.geometry.toBuffer()
    log octagonalPyramid.geometry.toBuffer()
    log nonagonalPyramid.geometry.toBuffer()
    log decagonalPyramid.geometry.toBuffer()
    log cone.geometry.toBuffer()

    log "### Surface Tests ###"

    log triangularPyramid.geometry.getSurface()
    log rectangularPyramid.geometry.getSurface()
    log pentagonalPyramid.geometry.getSurface()
    log hexagonalPyramid.geometry.getSurface()
    log heptagonalPyramid.geometry.getSurface()
    log octagonalPyramid.geometry.getSurface()
    log nonagonalPyramid.geometry.getSurface()
    log decagonalPyramid.geometry.getSurface()
    log cone.geometry.getSurface()

    log "### Volume Tests ###"

    log triangularPyramid.geometry.getVolume()
    log rectangularPyramid.geometry.getVolume()
    log pentagonalPyramid.geometry.getVolume()
    log hexagonalPyramid.geometry.getVolume()
    log heptagonalPyramid.geometry.getVolume()
    log octagonalPyramid.geometry.getVolume()
    log nonagonalPyramid.geometry.getVolume()
    log decagonalPyramid.geometry.getVolume()
    log cone.geometry.getVolume()
