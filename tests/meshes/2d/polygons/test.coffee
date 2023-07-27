polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 35
    camera.setPosition x: 42, y: 42, z: 84

    triangle = new Triangle name: "Triangle", color: blueThree, position: x: 0, y: 0, z: 0
    quadrilateral = new Quadrilateral name: "Quadrilateral", color: blueThree, position: x: 0, y: 0, z: 10
    pentagon = new Pentagon name: "Pentagon", color: blueThree, position: x: 0, y: 0, z: 20
    hexagon = new Hexagon name: "Hexagon", color: blueThree, position: x: 0, y: 0, z: 30
    heptagon = new Heptagon name: "Heptagon", color: blueThree, position: x: 0, y: 0, z: 40
    octagon = new Octagon name: "Octagon", color: blueThree, position: x: 0, y: 0, z: 50
    nonagon = new Nonagon name: "Nonagon", color: blueThree, position: x: 0, y: 0, z: 60
    decagon = new Decagon name: "Decagon", color: blueThree, position: x: 0, y: 0, z: 70

    log triangle
    log quadrilateral
    log pentagon
    log hexagon
    log heptagon
    log octagon
    log nonagon
    log decagon

    triangle.add()
    quadrilateral.add()
    pentagon.add()
    hexagon.add()
    heptagon.add()
    octagon.add()
    nonagon.add()
    decagon.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log triangle.getMaterial()
    log quadrilateral.getMaterial()
    log pentagon.getMaterial()
    log hexagon.getMaterial()
    log heptagon.getMaterial()
    log octagon.getMaterial()
    log nonagon.getMaterial()
    log decagon.getMaterial()

    triangle.setMaterial meshMaterialTest
    quadrilateral.setMaterial meshMaterialTest
    pentagon.setMaterial meshMaterialTest
    hexagon.setMaterial meshMaterialTest
    heptagon.setMaterial meshMaterialTest
    octagon.setMaterial meshMaterialTest
    nonagon.setMaterial meshMaterialTest
    decagon.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log triangle.getColor()
    log quadrilateral.getColor()
    log pentagon.getColor()
    log hexagon.getColor()
    log heptagon.getColor()
    log octagon.getColor()
    log nonagon.getColor()
    log decagon.getColor()

    triangle.setColor meshColorTest
    quadrilateral.setColor meshColorTest
    pentagon.setColor meshColorTest
    hexagon.setColor meshColorTest
    heptagon.setColor meshColorTest
    octagon.setColor meshColorTest
    nonagon.setColor meshColorTest
    decagon.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log triangle.getTransparent()
    log quadrilateral.getTransparent()
    log pentagon.getTransparent()
    log hexagon.getTransparent()
    log heptagon.getTransparent()
    log octagon.getTransparent()
    log nonagon.getTransparent()
    log decagon.getTransparent()

    triangle.setTransparent meshTransparentTest
    quadrilateral.setTransparent meshTransparentTest
    pentagon.setTransparent meshTransparentTest
    hexagon.setTransparent meshTransparentTest
    heptagon.setTransparent meshTransparentTest
    octagon.setTransparent meshTransparentTest
    nonagon.setTransparent meshTransparentTest
    decagon.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log triangle.getOpacity()
    log quadrilateral.getOpacity()
    log pentagon.getOpacity()
    log hexagon.getOpacity()
    log heptagon.getOpacity()
    log octagon.getOpacity()
    log nonagon.getOpacity()
    log decagon.getOpacity()

    triangle.setOpacity meshOpacityTest
    quadrilateral.setOpacity meshOpacityTest
    pentagon.setOpacity meshOpacityTest
    hexagon.setOpacity meshOpacityTest
    heptagon.setOpacity meshOpacityTest
    octagon.setOpacity meshOpacityTest
    nonagon.setOpacity meshOpacityTest
    decagon.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log triangle.getMetalness()
    log quadrilateral.getMetalness()
    log pentagon.getMetalness()
    log hexagon.getMetalness()
    log heptagon.getMetalness()
    log octagon.getMetalness()
    log nonagon.getMetalness()
    log decagon.getMetalness()

    triangle.setMetalness meshMetalnessTest
    quadrilateral.setMetalness meshMetalnessTest
    pentagon.setMetalness meshMetalnessTest
    hexagon.setMetalness meshMetalnessTest
    heptagon.setMetalness meshMetalnessTest
    octagon.setMetalness meshMetalnessTest
    nonagon.setMetalness meshMetalnessTest
    decagon.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log triangle.getRoughness()
    log quadrilateral.getRoughness()
    log pentagon.getRoughness()
    log hexagon.getRoughness()
    log heptagon.getRoughness()
    log octagon.getRoughness()
    log nonagon.getRoughness()
    log decagon.getRoughness()

    triangle.setRoughness meshRoughnessTest
    quadrilateral.setRoughness meshRoughnessTest
    pentagon.setRoughness meshRoughnessTest
    hexagon.setRoughness meshRoughnessTest
    heptagon.setRoughness meshRoughnessTest
    octagon.setRoughness meshRoughnessTest
    nonagon.setRoughness meshRoughnessTest
    decagon.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log triangle.getReflectivity()
    log quadrilateral.getReflectivity()
    log pentagon.getReflectivity()
    log hexagon.getReflectivity()
    log heptagon.getReflectivity()
    log octagon.getReflectivity()
    log nonagon.getReflectivity()
    log decagon.getReflectivity()

    triangle.setReflectivity meshReflectivityTest
    quadrilateral.setReflectivity meshReflectivityTest
    pentagon.setReflectivity meshReflectivityTest
    hexagon.setReflectivity meshReflectivityTest
    heptagon.setReflectivity meshReflectivityTest
    octagon.setReflectivity meshReflectivityTest
    nonagon.setReflectivity meshReflectivityTest
    decagon.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log triangle.getTransmission()
    log quadrilateral.getTransmission()
    log pentagon.getTransmission()
    log hexagon.getTransmission()
    log heptagon.getTransmission()
    log octagon.getTransmission()
    log nonagon.getTransmission()
    log decagon.getTransmission()

    triangle.setTransmission meshTransmissionTest
    quadrilateral.setTransmission meshTransmissionTest
    pentagon.setTransmission meshTransmissionTest
    hexagon.setTransmission meshTransmissionTest
    heptagon.setTransmission meshTransmissionTest
    octagon.setTransmission meshTransmissionTest
    nonagon.setTransmission meshTransmissionTest
    decagon.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log triangle.getWireframe()
    log quadrilateral.getWireframe()
    log pentagon.getWireframe()
    log hexagon.getWireframe()
    log heptagon.getWireframe()
    log octagon.getWireframe()
    log nonagon.getWireframe()
    log decagon.getWireframe()

    triangle.setWireframe meshWireframeTest
    quadrilateral.setWireframe meshWireframeTest
    pentagon.setWireframe meshWireframeTest
    hexagon.setWireframe meshWireframeTest
    heptagon.setWireframe meshWireframeTest
    octagon.setWireframe meshWireframeTest
    nonagon.setWireframe meshWireframeTest
    decagon.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log triangle.getSide()
    log quadrilateral.getSide()
    log pentagon.getSide()
    log hexagon.getSide()
    log heptagon.getSide()
    log octagon.getSide()
    log nonagon.getSide()
    log decagon.getSide()

    triangle.setSide meshSideTest
    quadrilateral.setSide meshSideTest
    pentagon.setSide meshSideTest
    hexagon.setSide meshSideTest
    heptagon.setSide meshSideTest
    octagon.setSide meshSideTest
    nonagon.setSide meshSideTest
    decagon.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log triangle.getBoundingSphere()
    log quadrilateral.getBoundingSphere()
    log pentagon.getBoundingSphere()
    log hexagon.getBoundingSphere()
    log heptagon.getBoundingSphere()
    log octagon.getBoundingSphere()
    log nonagon.getBoundingSphere()
    log decagon.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log triangle.getBoundingBox()
    log quadrilateral.getBoundingBox()
    log pentagon.getBoundingBox()
    log hexagon.getBoundingBox()
    log heptagon.getBoundingBox()
    log octagon.getBoundingBox()
    log nonagon.getBoundingBox()
    log decagon.getBoundingBox()

    log "### Buffer Tests ###"

    log triangle.getBuffer()
    log quadrilateral.getBuffer()
    log pentagon.getBuffer()
    log hexagon.getBuffer()
    log heptagon.getBuffer()
    log octagon.getBuffer()
    log nonagon.getBuffer()
    log decagon.getBuffer()

    log triangle.fromBuffer()
    log quadrilateral.fromBuffer()
    log pentagon.fromBuffer()
    log hexagon.fromBuffer()
    log heptagon.fromBuffer()
    log octagon.fromBuffer()
    log nonagon.fromBuffer()
    log decagon.fromBuffer()

    log triangle.toBuffer()
    log quadrilateral.toBuffer()
    log pentagon.toBuffer()
    log hexagon.toBuffer()
    log heptagon.toBuffer()
    log octagon.toBuffer()
    log nonagon.toBuffer()
    log decagon.toBuffer()

    log "### Surface Tests ###"

    log triangle.getSurface()
    log quadrilateral.getSurface()
    log pentagon.getSurface()
    log hexagon.getSurface()
    log heptagon.getSurface()
    log octagon.getSurface()
    log nonagon.getSurface()
    log decagon.getSurface()
