polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 60, y: 60, z: 100

    triangle = new Triangle name: "Triangle", position: x: 0, y: 0, z: 0
    quadrilateral = new Quadrilateral name: "Quadrilateral", position: x: 0, y: 0, z: 10
    pentagon = new Pentagon name: "Pentagon", position: x: 0, y: 0, z: 20
    hexagon = new Hexagon name: "Hexagon", position: x: 0, y: 0, z: 30
    heptagon = new Heptagon name: "Heptagon", position: x: 0, y: 0, z: 40
    octagon = new Octagon name: "Octagon", position: x: 0, y: 0, z: 50
    nonagon = new Nonagon name: "Nonagon", position: x: 0, y: 0, z: 60
    decagon = new Decagon name: "Decagon", position: x: 0, y: 0, z: 70

    log triangle.geometry
    log quadrilateral.geometry
    log pentagon.geometry
    log hexagon.geometry
    log heptagon.geometry
    log octagon.geometry
    log nonagon.geometry
    log decagon.geometry

    triangle.add()
    quadrilateral.add()
    pentagon.add()
    hexagon.add()
    heptagon.add()
    octagon.add()
    nonagon.add()
    decagon.add()

    log "### Buffer Tests ###"

    log triangle.geometry.getBuffer()
    log quadrilateral.geometry.getBuffer()
    log pentagon.geometry.getBuffer()
    log hexagon.geometry.getBuffer()
    log heptagon.geometry.getBuffer()
    log octagon.geometry.getBuffer()
    log nonagon.geometry.getBuffer()
    log decagon.geometry.getBuffer()

    log triangle.geometry.fromBuffer()
    log quadrilateral.geometry.fromBuffer()
    log pentagon.geometry.fromBuffer()
    log hexagon.geometry.fromBuffer()
    log heptagon.geometry.fromBuffer()
    log octagon.geometry.fromBuffer()
    log nonagon.geometry.fromBuffer()
    log decagon.geometry.fromBuffer()

    log triangle.geometry.toBuffer()
    log quadrilateral.geometry.toBuffer()
    log pentagon.geometry.toBuffer()
    log hexagon.geometry.toBuffer()
    log heptagon.geometry.toBuffer()
    log octagon.geometry.toBuffer()
    log nonagon.geometry.toBuffer()
    log decagon.geometry.toBuffer()

    log "### Surface Tests ###"

    log triangle.geometry.getSurface()
    log quadrilateral.geometry.getSurface()
    log pentagon.geometry.getSurface()
    log hexagon.geometry.getSurface()
    log heptagon.geometry.getSurface()
    log octagon.geometry.getSurface()
    log nonagon.geometry.getSurface()
    log decagon.geometry.getSurface()

    log triangle.geometry.setSurface()
    log quadrilateral.geometry.setSurface()
    log pentagon.geometry.setSurface()
    log hexagon.geometry.setSurface()
    log heptagon.geometry.setSurface()
    log octagon.geometry.setSurface()
    log nonagon.geometry.setSurface()
    log decagon.geometry.setSurface()
