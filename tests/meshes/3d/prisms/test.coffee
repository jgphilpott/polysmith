polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 60
    camera.setPosition x: 100, y: 100, z: 100

    triangularPrism = new TriangularPrism name: "Triangular Prism", color: blueThree, position: x: 0, y: 0, z: 0
    rectangularPrism = new RectangularPrism name: "Rectangular Prism", color: blueThree, position: x: 0, y: 0, z: 15
    pentagonalPrism = new PentagonalPrism name: "Pentagonal Prism", color: blueThree, position: x: 0, y: 0, z: 30
    hexagonalPrism = new HexagonalPrism name: "Hexagonal Prism", color: blueThree, position: x: 0, y: 0, z: 45
    heptagonalPrism = new HeptagonalPrism name: "Heptagonal Prism", color: blueThree, position: x: 0, y: 0, z: 60
    octagonalPrism = new OctagonalPrism name: "Octagonal Prism", color: blueThree, position: x: 0, y: 0, z: 75
    nonagonalPrism = new NonagonalPrism name: "Nonagonal Prism", color: blueThree, position: x: 0, y: 0, z: 90
    decagonalPrism = new DecagonalPrism name: "Decagonal Prism", color: blueThree, position: x: 0, y: 0, z: 105
    cylindricalPrism = new CylindricalPrism name: "Cylindrical Prism", color: blueThree, position: x: 0, y: 0, z: 120

    log triangularPrism
    log rectangularPrism
    log pentagonalPrism
    log hexagonalPrism
    log heptagonalPrism
    log octagonalPrism
    log nonagonalPrism
    log decagonalPrism
    log cylindricalPrism

    triangularPrism.add()
    rectangularPrism.add()
    pentagonalPrism.add()
    hexagonalPrism.add()
    heptagonalPrism.add()
    octagonalPrism.add()
    nonagonalPrism.add()
    decagonalPrism.add()
    cylindricalPrism.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log triangularPrism.getMaterial()
    log rectangularPrism.getMaterial()
    log pentagonalPrism.getMaterial()
    log hexagonalPrism.getMaterial()
    log heptagonalPrism.getMaterial()
    log octagonalPrism.getMaterial()
    log nonagonalPrism.getMaterial()
    log decagonalPrism.getMaterial()
    log cylindricalPrism.getMaterial()

    triangularPrism.setMaterial meshMaterialTest
    rectangularPrism.setMaterial meshMaterialTest
    pentagonalPrism.setMaterial meshMaterialTest
    hexagonalPrism.setMaterial meshMaterialTest
    heptagonalPrism.setMaterial meshMaterialTest
    octagonalPrism.setMaterial meshMaterialTest
    nonagonalPrism.setMaterial meshMaterialTest
    decagonalPrism.setMaterial meshMaterialTest
    cylindricalPrism.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log triangularPrism.getColor()
    log rectangularPrism.getColor()
    log pentagonalPrism.getColor()
    log hexagonalPrism.getColor()
    log heptagonalPrism.getColor()
    log octagonalPrism.getColor()
    log nonagonalPrism.getColor()
    log decagonalPrism.getColor()
    log cylindricalPrism.getColor()

    triangularPrism.setColor meshColorTest
    rectangularPrism.setColor meshColorTest
    pentagonalPrism.setColor meshColorTest
    hexagonalPrism.setColor meshColorTest
    heptagonalPrism.setColor meshColorTest
    octagonalPrism.setColor meshColorTest
    nonagonalPrism.setColor meshColorTest
    decagonalPrism.setColor meshColorTest
    cylindricalPrism.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log triangularPrism.getTransparent()
    log rectangularPrism.getTransparent()
    log pentagonalPrism.getTransparent()
    log hexagonalPrism.getTransparent()
    log heptagonalPrism.getTransparent()
    log octagonalPrism.getTransparent()
    log nonagonalPrism.getTransparent()
    log decagonalPrism.getTransparent()
    log cylindricalPrism.getTransparent()

    triangularPrism.setTransparent meshTransparentTest
    rectangularPrism.setTransparent meshTransparentTest
    pentagonalPrism.setTransparent meshTransparentTest
    hexagonalPrism.setTransparent meshTransparentTest
    heptagonalPrism.setTransparent meshTransparentTest
    octagonalPrism.setTransparent meshTransparentTest
    nonagonalPrism.setTransparent meshTransparentTest
    decagonalPrism.setTransparent meshTransparentTest
    cylindricalPrism.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log triangularPrism.getOpacity()
    log rectangularPrism.getOpacity()
    log pentagonalPrism.getOpacity()
    log hexagonalPrism.getOpacity()
    log heptagonalPrism.getOpacity()
    log octagonalPrism.getOpacity()
    log nonagonalPrism.getOpacity()
    log decagonalPrism.getOpacity()
    log cylindricalPrism.getOpacity()

    triangularPrism.setOpacity meshOpacityTest
    rectangularPrism.setOpacity meshOpacityTest
    pentagonalPrism.setOpacity meshOpacityTest
    hexagonalPrism.setOpacity meshOpacityTest
    heptagonalPrism.setOpacity meshOpacityTest
    octagonalPrism.setOpacity meshOpacityTest
    nonagonalPrism.setOpacity meshOpacityTest
    decagonalPrism.setOpacity meshOpacityTest
    cylindricalPrism.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log triangularPrism.getMetalness()
    log rectangularPrism.getMetalness()
    log pentagonalPrism.getMetalness()
    log hexagonalPrism.getMetalness()
    log heptagonalPrism.getMetalness()
    log octagonalPrism.getMetalness()
    log nonagonalPrism.getMetalness()
    log decagonalPrism.getMetalness()
    log cylindricalPrism.getMetalness()

    triangularPrism.setMetalness meshMetalnessTest
    rectangularPrism.setMetalness meshMetalnessTest
    pentagonalPrism.setMetalness meshMetalnessTest
    hexagonalPrism.setMetalness meshMetalnessTest
    heptagonalPrism.setMetalness meshMetalnessTest
    octagonalPrism.setMetalness meshMetalnessTest
    nonagonalPrism.setMetalness meshMetalnessTest
    decagonalPrism.setMetalness meshMetalnessTest
    cylindricalPrism.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log triangularPrism.getRoughness()
    log rectangularPrism.getRoughness()
    log pentagonalPrism.getRoughness()
    log hexagonalPrism.getRoughness()
    log heptagonalPrism.getRoughness()
    log octagonalPrism.getRoughness()
    log nonagonalPrism.getRoughness()
    log decagonalPrism.getRoughness()
    log cylindricalPrism.getRoughness()

    triangularPrism.setRoughness meshRoughnessTest
    rectangularPrism.setRoughness meshRoughnessTest
    pentagonalPrism.setRoughness meshRoughnessTest
    hexagonalPrism.setRoughness meshRoughnessTest
    heptagonalPrism.setRoughness meshRoughnessTest
    octagonalPrism.setRoughness meshRoughnessTest
    nonagonalPrism.setRoughness meshRoughnessTest
    decagonalPrism.setRoughness meshRoughnessTest
    cylindricalPrism.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log triangularPrism.getReflectivity()
    log rectangularPrism.getReflectivity()
    log pentagonalPrism.getReflectivity()
    log hexagonalPrism.getReflectivity()
    log heptagonalPrism.getReflectivity()
    log octagonalPrism.getReflectivity()
    log nonagonalPrism.getReflectivity()
    log decagonalPrism.getReflectivity()
    log cylindricalPrism.getReflectivity()

    triangularPrism.setReflectivity meshReflectivityTest
    rectangularPrism.setReflectivity meshReflectivityTest
    pentagonalPrism.setReflectivity meshReflectivityTest
    hexagonalPrism.setReflectivity meshReflectivityTest
    heptagonalPrism.setReflectivity meshReflectivityTest
    octagonalPrism.setReflectivity meshReflectivityTest
    nonagonalPrism.setReflectivity meshReflectivityTest
    decagonalPrism.setReflectivity meshReflectivityTest
    cylindricalPrism.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log triangularPrism.getTransmission()
    log rectangularPrism.getTransmission()
    log pentagonalPrism.getTransmission()
    log hexagonalPrism.getTransmission()
    log heptagonalPrism.getTransmission()
    log octagonalPrism.getTransmission()
    log nonagonalPrism.getTransmission()
    log decagonalPrism.getTransmission()
    log cylindricalPrism.getTransmission()

    triangularPrism.setTransmission meshTransmissionTest
    rectangularPrism.setTransmission meshTransmissionTest
    pentagonalPrism.setTransmission meshTransmissionTest
    hexagonalPrism.setTransmission meshTransmissionTest
    heptagonalPrism.setTransmission meshTransmissionTest
    octagonalPrism.setTransmission meshTransmissionTest
    nonagonalPrism.setTransmission meshTransmissionTest
    decagonalPrism.setTransmission meshTransmissionTest
    cylindricalPrism.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log triangularPrism.getWireframe()
    log rectangularPrism.getWireframe()
    log pentagonalPrism.getWireframe()
    log hexagonalPrism.getWireframe()
    log heptagonalPrism.getWireframe()
    log octagonalPrism.getWireframe()
    log nonagonalPrism.getWireframe()
    log decagonalPrism.getWireframe()
    log cylindricalPrism.getWireframe()

    triangularPrism.setWireframe meshWireframeTest
    rectangularPrism.setWireframe meshWireframeTest
    pentagonalPrism.setWireframe meshWireframeTest
    hexagonalPrism.setWireframe meshWireframeTest
    heptagonalPrism.setWireframe meshWireframeTest
    octagonalPrism.setWireframe meshWireframeTest
    nonagonalPrism.setWireframe meshWireframeTest
    decagonalPrism.setWireframe meshWireframeTest
    cylindricalPrism.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log triangularPrism.getSide()
    log rectangularPrism.getSide()
    log pentagonalPrism.getSide()
    log hexagonalPrism.getSide()
    log heptagonalPrism.getSide()
    log octagonalPrism.getSide()
    log nonagonalPrism.getSide()
    log decagonalPrism.getSide()
    log cylindricalPrism.getSide()

    triangularPrism.setSide meshSideTest
    rectangularPrism.setSide meshSideTest
    pentagonalPrism.setSide meshSideTest
    hexagonalPrism.setSide meshSideTest
    heptagonalPrism.setSide meshSideTest
    octagonalPrism.setSide meshSideTest
    nonagonalPrism.setSide meshSideTest
    decagonalPrism.setSide meshSideTest
    cylindricalPrism.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log triangularPrism.getBoundingSphere()
    log rectangularPrism.getBoundingSphere()
    log pentagonalPrism.getBoundingSphere()
    log hexagonalPrism.getBoundingSphere()
    log heptagonalPrism.getBoundingSphere()
    log octagonalPrism.getBoundingSphere()
    log nonagonalPrism.getBoundingSphere()
    log decagonalPrism.getBoundingSphere()
    log cylindricalPrism.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log triangularPrism.getBoundingBox()
    log rectangularPrism.getBoundingBox()
    log pentagonalPrism.getBoundingBox()
    log hexagonalPrism.getBoundingBox()
    log heptagonalPrism.getBoundingBox()
    log octagonalPrism.getBoundingBox()
    log nonagonalPrism.getBoundingBox()
    log decagonalPrism.getBoundingBox()
    log cylindricalPrism.getBoundingBox()

    log "### Buffer Tests ###"

    log triangularPrism.getBuffer()
    log rectangularPrism.getBuffer()
    log pentagonalPrism.getBuffer()
    log hexagonalPrism.getBuffer()
    log heptagonalPrism.getBuffer()
    log octagonalPrism.getBuffer()
    log nonagonalPrism.getBuffer()
    log decagonalPrism.getBuffer()
    log cylindricalPrism.getBuffer()

    log triangularPrism.fromBuffer()
    log rectangularPrism.fromBuffer()
    log pentagonalPrism.fromBuffer()
    log hexagonalPrism.fromBuffer()
    log heptagonalPrism.fromBuffer()
    log octagonalPrism.fromBuffer()
    log nonagonalPrism.fromBuffer()
    log decagonalPrism.fromBuffer()
    log cylindricalPrism.fromBuffer()

    log triangularPrism.toBuffer()
    log rectangularPrism.toBuffer()
    log pentagonalPrism.toBuffer()
    log hexagonalPrism.toBuffer()
    log heptagonalPrism.toBuffer()
    log octagonalPrism.toBuffer()
    log nonagonalPrism.toBuffer()
    log decagonalPrism.toBuffer()
    log cylindricalPrism.toBuffer()

    log "### Surface Tests ###"

    log triangularPrism.getSurface()
    log rectangularPrism.getSurface()
    log pentagonalPrism.getSurface()
    log hexagonalPrism.getSurface()
    log heptagonalPrism.getSurface()
    log octagonalPrism.getSurface()
    log nonagonalPrism.getSurface()
    log decagonalPrism.getSurface()
    log cylindricalPrism.getSurface()

    log "### Volume Tests ###"

    log triangularPrism.getVolume()
    log rectangularPrism.getVolume()
    log pentagonalPrism.getVolume()
    log hexagonalPrism.getVolume()
    log heptagonalPrism.getVolume()
    log octagonalPrism.getVolume()
    log nonagonalPrism.getVolume()
    log decagonalPrism.getVolume()
    log cylindricalPrism.getVolume()

    log "### Length Tests ###"

    prismLengthTest = 20

    log triangularPrism.getLength()
    log rectangularPrism.getLength()
    log pentagonalPrism.getLength()
    log hexagonalPrism.getLength()
    log heptagonalPrism.getLength()
    log octagonalPrism.getLength()
    log nonagonalPrism.getLength()
    log decagonalPrism.getLength()
    log cylindricalPrism.getLength()

    triangularPrism.setLength prismLengthTest
    rectangularPrism.setLength prismLengthTest
    pentagonalPrism.setLength prismLengthTest
    hexagonalPrism.setLength prismLengthTest
    heptagonalPrism.setLength prismLengthTest
    octagonalPrism.setLength prismLengthTest
    nonagonalPrism.setLength prismLengthTest
    decagonalPrism.setLength prismLengthTest
    cylindricalPrism.setLength prismLengthTest

    log "### Positive Radius Tests ###"

    prismPositiveRadiusTest = 7

    log triangularPrism.getPositiveRadius()
    log rectangularPrism.getPositiveRadius()
    log pentagonalPrism.getPositiveRadius()
    log hexagonalPrism.getPositiveRadius()
    log heptagonalPrism.getPositiveRadius()
    log octagonalPrism.getPositiveRadius()
    log nonagonalPrism.getPositiveRadius()
    log decagonalPrism.getPositiveRadius()
    log cylindricalPrism.getPositiveRadius()

    triangularPrism.setPositiveRadius prismPositiveRadiusTest
    rectangularPrism.setPositiveRadius prismPositiveRadiusTest
    pentagonalPrism.setPositiveRadius prismPositiveRadiusTest
    hexagonalPrism.setPositiveRadius prismPositiveRadiusTest
    heptagonalPrism.setPositiveRadius prismPositiveRadiusTest
    octagonalPrism.setPositiveRadius prismPositiveRadiusTest
    nonagonalPrism.setPositiveRadius prismPositiveRadiusTest
    decagonalPrism.setPositiveRadius prismPositiveRadiusTest
    cylindricalPrism.setPositiveRadius prismPositiveRadiusTest

    log "### Negative Radius Tests ###"

    prismNegativeRadiusTest = 7

    log triangularPrism.getNegativeRadius()
    log rectangularPrism.getNegativeRadius()
    log pentagonalPrism.getNegativeRadius()
    log hexagonalPrism.getNegativeRadius()
    log heptagonalPrism.getNegativeRadius()
    log octagonalPrism.getNegativeRadius()
    log nonagonalPrism.getNegativeRadius()
    log decagonalPrism.getNegativeRadius()
    log cylindricalPrism.getNegativeRadius()

    triangularPrism.setNegativeRadius prismNegativeRadiusTest
    rectangularPrism.setNegativeRadius prismNegativeRadiusTest
    pentagonalPrism.setNegativeRadius prismNegativeRadiusTest
    hexagonalPrism.setNegativeRadius prismNegativeRadiusTest
    heptagonalPrism.setNegativeRadius prismNegativeRadiusTest
    octagonalPrism.setNegativeRadius prismNegativeRadiusTest
    nonagonalPrism.setNegativeRadius prismNegativeRadiusTest
    decagonalPrism.setNegativeRadius prismNegativeRadiusTest
    cylindricalPrism.setNegativeRadius prismNegativeRadiusTest

    log "### Radial Segments Tests ###"

    prismRadialSegmentsTest = 14

    log triangularPrism.getRadialSegments()
    log rectangularPrism.getRadialSegments()
    log pentagonalPrism.getRadialSegments()
    log hexagonalPrism.getRadialSegments()
    log heptagonalPrism.getRadialSegments()
    log octagonalPrism.getRadialSegments()
    log nonagonalPrism.getRadialSegments()
    log decagonalPrism.getRadialSegments()
    log cylindricalPrism.getRadialSegments()

    triangularPrism.setRadialSegments prismRadialSegmentsTest
    rectangularPrism.setRadialSegments prismRadialSegmentsTest
    pentagonalPrism.setRadialSegments prismRadialSegmentsTest
    hexagonalPrism.setRadialSegments prismRadialSegmentsTest
    heptagonalPrism.setRadialSegments prismRadialSegmentsTest
    octagonalPrism.setRadialSegments prismRadialSegmentsTest
    nonagonalPrism.setRadialSegments prismRadialSegmentsTest
    decagonalPrism.setRadialSegments prismRadialSegmentsTest
    cylindricalPrism.setRadialSegments prismRadialSegmentsTest

    log "### Length Segments Tests ###"

    prismLengthSegmentsTest = 3

    log triangularPrism.getLengthSegments()
    log rectangularPrism.getLengthSegments()
    log pentagonalPrism.getLengthSegments()
    log hexagonalPrism.getLengthSegments()
    log heptagonalPrism.getLengthSegments()
    log octagonalPrism.getLengthSegments()
    log nonagonalPrism.getLengthSegments()
    log decagonalPrism.getLengthSegments()
    log cylindricalPrism.getLengthSegments()

    triangularPrism.setLengthSegments prismLengthSegmentsTest
    rectangularPrism.setLengthSegments prismLengthSegmentsTest
    pentagonalPrism.setLengthSegments prismLengthSegmentsTest
    hexagonalPrism.setLengthSegments prismLengthSegmentsTest
    heptagonalPrism.setLengthSegments prismLengthSegmentsTest
    octagonalPrism.setLengthSegments prismLengthSegmentsTest
    nonagonalPrism.setLengthSegments prismLengthSegmentsTest
    decagonalPrism.setLengthSegments prismLengthSegmentsTest
    cylindricalPrism.setLengthSegments prismLengthSegmentsTest

    log "### Open Ended Tests ###"

    prismOpenEndedTest1 = true
    prismOpenEndedTest2 = false

    prismOpenEndedTest = prismOpenEndedTest1

    log triangularPrism.getOpenEnded()
    log rectangularPrism.getOpenEnded()
    log pentagonalPrism.getOpenEnded()
    log hexagonalPrism.getOpenEnded()
    log heptagonalPrism.getOpenEnded()
    log octagonalPrism.getOpenEnded()
    log nonagonalPrism.getOpenEnded()
    log decagonalPrism.getOpenEnded()
    log cylindricalPrism.getOpenEnded()

    triangularPrism.setOpenEnded prismOpenEndedTest
    rectangularPrism.setOpenEnded prismOpenEndedTest
    pentagonalPrism.setOpenEnded prismOpenEndedTest
    hexagonalPrism.setOpenEnded prismOpenEndedTest
    heptagonalPrism.setOpenEnded prismOpenEndedTest
    octagonalPrism.setOpenEnded prismOpenEndedTest
    nonagonalPrism.setOpenEnded prismOpenEndedTest
    decagonalPrism.setOpenEnded prismOpenEndedTest
    cylindricalPrism.setOpenEnded prismOpenEndedTest

    log "### Theta Start Tests ###"

    prismThetaStartTest = 90

    log triangularPrism.getThetaStart()
    log rectangularPrism.getThetaStart()
    log pentagonalPrism.getThetaStart()
    log hexagonalPrism.getThetaStart()
    log heptagonalPrism.getThetaStart()
    log octagonalPrism.getThetaStart()
    log nonagonalPrism.getThetaStart()
    log decagonalPrism.getThetaStart()
    log cylindricalPrism.getThetaStart()

    triangularPrism.setThetaStart prismThetaStartTest
    rectangularPrism.setThetaStart prismThetaStartTest
    pentagonalPrism.setThetaStart prismThetaStartTest
    hexagonalPrism.setThetaStart prismThetaStartTest
    heptagonalPrism.setThetaStart prismThetaStartTest
    octagonalPrism.setThetaStart prismThetaStartTest
    nonagonalPrism.setThetaStart prismThetaStartTest
    decagonalPrism.setThetaStart prismThetaStartTest
    cylindricalPrism.setThetaStart prismThetaStartTest

    log "### Theta Length Tests ###"

    prismThetaLengthTest = 180

    log triangularPrism.getThetaLength()
    log rectangularPrism.getThetaLength()
    log pentagonalPrism.getThetaLength()
    log hexagonalPrism.getThetaLength()
    log heptagonalPrism.getThetaLength()
    log octagonalPrism.getThetaLength()
    log nonagonalPrism.getThetaLength()
    log decagonalPrism.getThetaLength()
    log cylindricalPrism.getThetaLength()

    triangularPrism.setThetaLength prismThetaLengthTest
    rectangularPrism.setThetaLength prismThetaLengthTest
    pentagonalPrism.setThetaLength prismThetaLengthTest
    hexagonalPrism.setThetaLength prismThetaLengthTest
    heptagonalPrism.setThetaLength prismThetaLengthTest
    octagonalPrism.setThetaLength prismThetaLengthTest
    nonagonalPrism.setThetaLength prismThetaLengthTest
    decagonalPrism.setThetaLength prismThetaLengthTest
    cylindricalPrism.setThetaLength prismThetaLengthTest

    log "### Type Tests ###"

    prismTypeTest = "cylindrical-prism"

    log triangularPrism.getType()
    log rectangularPrism.getType()
    log pentagonalPrism.getType()
    log hexagonalPrism.getType()
    log heptagonalPrism.getType()
    log octagonalPrism.getType()
    log nonagonalPrism.getType()
    log decagonalPrism.getType()
    log cylindricalPrism.getType()

    triangularPrism.setType prismTypeTest
    rectangularPrism.setType prismTypeTest
    pentagonalPrism.setType prismTypeTest
    hexagonalPrism.setType prismTypeTest
    heptagonalPrism.setType prismTypeTest
    octagonalPrism.setType prismTypeTest
    nonagonalPrism.setType prismTypeTest
    decagonalPrism.setType prismTypeTest
    cylindricalPrism.setType prismTypeTest
