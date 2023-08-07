polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 60
    camera.setPosition x: 100, y: 100, z: 100

    triangularPyramid = new TriangularPyramid name: "Triangular Pyramid", color: blueThree, position: x: 0, y: 0, z: 0
    rectangularPyramid = new RectangularPyramid name: "Rectangular Pyramid", color: blueThree, position: x: 0, y: 0, z: 15
    pentagonalPyramid = new PentagonalPyramid name: "Pentagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 30
    hexagonalPyramid = new HexagonalPyramid name: "Hexagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 45
    heptagonalPyramid = new HeptagonalPyramid name: "Heptagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 60
    octagonalPyramid = new OctagonalPyramid name: "Octagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 75
    nonagonalPyramid = new NonagonalPyramid name: "Nonagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 90
    decagonalPyramid = new DecagonalPyramid name: "Decagonal Pyramid", color: blueThree, position: x: 0, y: 0, z: 105
    cone = new Cone name: "Cone", color: blueThree, position: x: 0, y: 0, z: 120

    log triangularPyramid
    log rectangularPyramid
    log pentagonalPyramid
    log hexagonalPyramid
    log heptagonalPyramid
    log octagonalPyramid
    log nonagonalPyramid
    log decagonalPyramid
    log cone

    triangularPyramid.add()
    rectangularPyramid.add()
    pentagonalPyramid.add()
    hexagonalPyramid.add()
    heptagonalPyramid.add()
    octagonalPyramid.add()
    nonagonalPyramid.add()
    decagonalPyramid.add()
    cone.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log triangularPyramid.getMaterial()
    log rectangularPyramid.getMaterial()
    log pentagonalPyramid.getMaterial()
    log hexagonalPyramid.getMaterial()
    log heptagonalPyramid.getMaterial()
    log octagonalPyramid.getMaterial()
    log nonagonalPyramid.getMaterial()
    log decagonalPyramid.getMaterial()
    log cone.getMaterial()

    triangularPyramid.setMaterial meshMaterialTest
    rectangularPyramid.setMaterial meshMaterialTest
    pentagonalPyramid.setMaterial meshMaterialTest
    hexagonalPyramid.setMaterial meshMaterialTest
    heptagonalPyramid.setMaterial meshMaterialTest
    octagonalPyramid.setMaterial meshMaterialTest
    nonagonalPyramid.setMaterial meshMaterialTest
    decagonalPyramid.setMaterial meshMaterialTest
    cone.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log triangularPyramid.getColor()
    log rectangularPyramid.getColor()
    log pentagonalPyramid.getColor()
    log hexagonalPyramid.getColor()
    log heptagonalPyramid.getColor()
    log octagonalPyramid.getColor()
    log nonagonalPyramid.getColor()
    log decagonalPyramid.getColor()
    log cone.getColor()

    triangularPyramid.setColor meshColorTest
    rectangularPyramid.setColor meshColorTest
    pentagonalPyramid.setColor meshColorTest
    hexagonalPyramid.setColor meshColorTest
    heptagonalPyramid.setColor meshColorTest
    octagonalPyramid.setColor meshColorTest
    nonagonalPyramid.setColor meshColorTest
    decagonalPyramid.setColor meshColorTest
    cone.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log triangularPyramid.getTransparent()
    log rectangularPyramid.getTransparent()
    log pentagonalPyramid.getTransparent()
    log hexagonalPyramid.getTransparent()
    log heptagonalPyramid.getTransparent()
    log octagonalPyramid.getTransparent()
    log nonagonalPyramid.getTransparent()
    log decagonalPyramid.getTransparent()
    log cone.getTransparent()

    triangularPyramid.setTransparent meshTransparentTest
    rectangularPyramid.setTransparent meshTransparentTest
    pentagonalPyramid.setTransparent meshTransparentTest
    hexagonalPyramid.setTransparent meshTransparentTest
    heptagonalPyramid.setTransparent meshTransparentTest
    octagonalPyramid.setTransparent meshTransparentTest
    nonagonalPyramid.setTransparent meshTransparentTest
    decagonalPyramid.setTransparent meshTransparentTest
    cone.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log triangularPyramid.getOpacity()
    log rectangularPyramid.getOpacity()
    log pentagonalPyramid.getOpacity()
    log hexagonalPyramid.getOpacity()
    log heptagonalPyramid.getOpacity()
    log octagonalPyramid.getOpacity()
    log nonagonalPyramid.getOpacity()
    log decagonalPyramid.getOpacity()
    log cone.getOpacity()

    triangularPyramid.setOpacity meshOpacityTest
    rectangularPyramid.setOpacity meshOpacityTest
    pentagonalPyramid.setOpacity meshOpacityTest
    hexagonalPyramid.setOpacity meshOpacityTest
    heptagonalPyramid.setOpacity meshOpacityTest
    octagonalPyramid.setOpacity meshOpacityTest
    nonagonalPyramid.setOpacity meshOpacityTest
    decagonalPyramid.setOpacity meshOpacityTest
    cone.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log triangularPyramid.getMetalness()
    log rectangularPyramid.getMetalness()
    log pentagonalPyramid.getMetalness()
    log hexagonalPyramid.getMetalness()
    log heptagonalPyramid.getMetalness()
    log octagonalPyramid.getMetalness()
    log nonagonalPyramid.getMetalness()
    log decagonalPyramid.getMetalness()
    log cone.getMetalness()

    triangularPyramid.setMetalness meshMetalnessTest
    rectangularPyramid.setMetalness meshMetalnessTest
    pentagonalPyramid.setMetalness meshMetalnessTest
    hexagonalPyramid.setMetalness meshMetalnessTest
    heptagonalPyramid.setMetalness meshMetalnessTest
    octagonalPyramid.setMetalness meshMetalnessTest
    nonagonalPyramid.setMetalness meshMetalnessTest
    decagonalPyramid.setMetalness meshMetalnessTest
    cone.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log triangularPyramid.getRoughness()
    log rectangularPyramid.getRoughness()
    log pentagonalPyramid.getRoughness()
    log hexagonalPyramid.getRoughness()
    log heptagonalPyramid.getRoughness()
    log octagonalPyramid.getRoughness()
    log nonagonalPyramid.getRoughness()
    log decagonalPyramid.getRoughness()
    log cone.getRoughness()

    triangularPyramid.setRoughness meshRoughnessTest
    rectangularPyramid.setRoughness meshRoughnessTest
    pentagonalPyramid.setRoughness meshRoughnessTest
    hexagonalPyramid.setRoughness meshRoughnessTest
    heptagonalPyramid.setRoughness meshRoughnessTest
    octagonalPyramid.setRoughness meshRoughnessTest
    nonagonalPyramid.setRoughness meshRoughnessTest
    decagonalPyramid.setRoughness meshRoughnessTest
    cone.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log triangularPyramid.getReflectivity()
    log rectangularPyramid.getReflectivity()
    log pentagonalPyramid.getReflectivity()
    log hexagonalPyramid.getReflectivity()
    log heptagonalPyramid.getReflectivity()
    log octagonalPyramid.getReflectivity()
    log nonagonalPyramid.getReflectivity()
    log decagonalPyramid.getReflectivity()
    log cone.getReflectivity()

    triangularPyramid.setReflectivity meshReflectivityTest
    rectangularPyramid.setReflectivity meshReflectivityTest
    pentagonalPyramid.setReflectivity meshReflectivityTest
    hexagonalPyramid.setReflectivity meshReflectivityTest
    heptagonalPyramid.setReflectivity meshReflectivityTest
    octagonalPyramid.setReflectivity meshReflectivityTest
    nonagonalPyramid.setReflectivity meshReflectivityTest
    decagonalPyramid.setReflectivity meshReflectivityTest
    cone.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log triangularPyramid.getTransmission()
    log rectangularPyramid.getTransmission()
    log pentagonalPyramid.getTransmission()
    log hexagonalPyramid.getTransmission()
    log heptagonalPyramid.getTransmission()
    log octagonalPyramid.getTransmission()
    log nonagonalPyramid.getTransmission()
    log decagonalPyramid.getTransmission()
    log cone.getTransmission()

    triangularPyramid.setTransmission meshTransmissionTest
    rectangularPyramid.setTransmission meshTransmissionTest
    pentagonalPyramid.setTransmission meshTransmissionTest
    hexagonalPyramid.setTransmission meshTransmissionTest
    heptagonalPyramid.setTransmission meshTransmissionTest
    octagonalPyramid.setTransmission meshTransmissionTest
    nonagonalPyramid.setTransmission meshTransmissionTest
    decagonalPyramid.setTransmission meshTransmissionTest
    cone.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log triangularPyramid.getWireframe()
    log rectangularPyramid.getWireframe()
    log pentagonalPyramid.getWireframe()
    log hexagonalPyramid.getWireframe()
    log heptagonalPyramid.getWireframe()
    log octagonalPyramid.getWireframe()
    log nonagonalPyramid.getWireframe()
    log decagonalPyramid.getWireframe()
    log cone.getWireframe()

    triangularPyramid.setWireframe meshWireframeTest
    rectangularPyramid.setWireframe meshWireframeTest
    pentagonalPyramid.setWireframe meshWireframeTest
    hexagonalPyramid.setWireframe meshWireframeTest
    heptagonalPyramid.setWireframe meshWireframeTest
    octagonalPyramid.setWireframe meshWireframeTest
    nonagonalPyramid.setWireframe meshWireframeTest
    decagonalPyramid.setWireframe meshWireframeTest
    cone.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log triangularPyramid.getSide()
    log rectangularPyramid.getSide()
    log pentagonalPyramid.getSide()
    log hexagonalPyramid.getSide()
    log heptagonalPyramid.getSide()
    log octagonalPyramid.getSide()
    log nonagonalPyramid.getSide()
    log decagonalPyramid.getSide()
    log cone.getSide()

    triangularPyramid.setSide meshSideTest
    rectangularPyramid.setSide meshSideTest
    pentagonalPyramid.setSide meshSideTest
    hexagonalPyramid.setSide meshSideTest
    heptagonalPyramid.setSide meshSideTest
    octagonalPyramid.setSide meshSideTest
    nonagonalPyramid.setSide meshSideTest
    decagonalPyramid.setSide meshSideTest
    cone.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log triangularPyramid.getBoundingSphere()
    log rectangularPyramid.getBoundingSphere()
    log pentagonalPyramid.getBoundingSphere()
    log hexagonalPyramid.getBoundingSphere()
    log heptagonalPyramid.getBoundingSphere()
    log octagonalPyramid.getBoundingSphere()
    log nonagonalPyramid.getBoundingSphere()
    log decagonalPyramid.getBoundingSphere()
    log cone.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log triangularPyramid.getBoundingBox()
    log rectangularPyramid.getBoundingBox()
    log pentagonalPyramid.getBoundingBox()
    log hexagonalPyramid.getBoundingBox()
    log heptagonalPyramid.getBoundingBox()
    log octagonalPyramid.getBoundingBox()
    log nonagonalPyramid.getBoundingBox()
    log decagonalPyramid.getBoundingBox()
    log cone.getBoundingBox()

    log "### Buffer Tests ###"

    log triangularPyramid.getBuffer()
    log rectangularPyramid.getBuffer()
    log pentagonalPyramid.getBuffer()
    log hexagonalPyramid.getBuffer()
    log heptagonalPyramid.getBuffer()
    log octagonalPyramid.getBuffer()
    log nonagonalPyramid.getBuffer()
    log decagonalPyramid.getBuffer()
    log cone.getBuffer()

    log triangularPyramid.fromBuffer()
    log rectangularPyramid.fromBuffer()
    log pentagonalPyramid.fromBuffer()
    log hexagonalPyramid.fromBuffer()
    log heptagonalPyramid.fromBuffer()
    log octagonalPyramid.fromBuffer()
    log nonagonalPyramid.fromBuffer()
    log decagonalPyramid.fromBuffer()
    log cone.fromBuffer()

    log triangularPyramid.toBuffer()
    log rectangularPyramid.toBuffer()
    log pentagonalPyramid.toBuffer()
    log hexagonalPyramid.toBuffer()
    log heptagonalPyramid.toBuffer()
    log octagonalPyramid.toBuffer()
    log nonagonalPyramid.toBuffer()
    log decagonalPyramid.toBuffer()
    log cone.toBuffer()

    log "### Surface Tests ###"

    log triangularPyramid.getSurface()
    log rectangularPyramid.getSurface()
    log pentagonalPyramid.getSurface()
    log hexagonalPyramid.getSurface()
    log heptagonalPyramid.getSurface()
    log octagonalPyramid.getSurface()
    log nonagonalPyramid.getSurface()
    log decagonalPyramid.getSurface()
    log cone.getSurface()

    log "### Volume Tests ###"

    log triangularPyramid.getVolume()
    log rectangularPyramid.getVolume()
    log pentagonalPyramid.getVolume()
    log hexagonalPyramid.getVolume()
    log heptagonalPyramid.getVolume()
    log octagonalPyramid.getVolume()
    log nonagonalPyramid.getVolume()
    log decagonalPyramid.getVolume()
    log cone.getVolume()

    log "### Radius Tests ###"

    pyramidRadiusTest = 10

    log triangularPyramid.getRadius()
    log rectangularPyramid.getRadius()
    log pentagonalPyramid.getRadius()
    log hexagonalPyramid.getRadius()
    log heptagonalPyramid.getRadius()
    log octagonalPyramid.getRadius()
    log nonagonalPyramid.getRadius()
    log decagonalPyramid.getRadius()
    log cone.getRadius()

    triangularPyramid.setRadius pyramidRadiusTest
    rectangularPyramid.setRadius pyramidRadiusTest
    pentagonalPyramid.setRadius pyramidRadiusTest
    hexagonalPyramid.setRadius pyramidRadiusTest
    heptagonalPyramid.setRadius pyramidRadiusTest
    octagonalPyramid.setRadius pyramidRadiusTest
    nonagonalPyramid.setRadius pyramidRadiusTest
    decagonalPyramid.setRadius pyramidRadiusTest
    cone.setRadius pyramidRadiusTest

    log "### Height Tests ###"

    pyramidHeightTest = 5

    log triangularPyramid.getHeight()
    log rectangularPyramid.getHeight()
    log pentagonalPyramid.getHeight()
    log hexagonalPyramid.getHeight()
    log heptagonalPyramid.getHeight()
    log octagonalPyramid.getHeight()
    log nonagonalPyramid.getHeight()
    log decagonalPyramid.getHeight()
    log cone.getHeight()

    triangularPyramid.setHeight pyramidHeightTest
    rectangularPyramid.setHeight pyramidHeightTest
    pentagonalPyramid.setHeight pyramidHeightTest
    hexagonalPyramid.setHeight pyramidHeightTest
    heptagonalPyramid.setHeight pyramidHeightTest
    octagonalPyramid.setHeight pyramidHeightTest
    nonagonalPyramid.setHeight pyramidHeightTest
    decagonalPyramid.setHeight pyramidHeightTest
    cone.setHeight pyramidHeightTest

    log "### Radial Segments Tests ###"

    pyramidRadialSegmentsTest = 14

    log triangularPyramid.getRadialSegments()
    log rectangularPyramid.getRadialSegments()
    log pentagonalPyramid.getRadialSegments()
    log hexagonalPyramid.getRadialSegments()
    log heptagonalPyramid.getRadialSegments()
    log octagonalPyramid.getRadialSegments()
    log nonagonalPyramid.getRadialSegments()
    log decagonalPyramid.getRadialSegments()
    log cone.getRadialSegments()

    triangularPyramid.setRadialSegments pyramidRadialSegmentsTest
    rectangularPyramid.setRadialSegments pyramidRadialSegmentsTest
    pentagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    hexagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    heptagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    octagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    nonagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    decagonalPyramid.setRadialSegments pyramidRadialSegmentsTest
    cone.setRadialSegments pyramidRadialSegmentsTest

    log "### Height Segments Tests ###"

    pyramidHeightSegmentsTest = 3

    log triangularPyramid.getHeightSegments()
    log rectangularPyramid.getHeightSegments()
    log pentagonalPyramid.getHeightSegments()
    log hexagonalPyramid.getHeightSegments()
    log heptagonalPyramid.getHeightSegments()
    log octagonalPyramid.getHeightSegments()
    log nonagonalPyramid.getHeightSegments()
    log decagonalPyramid.getHeightSegments()
    log cone.getHeightSegments()

    triangularPyramid.setHeightSegments pyramidHeightSegmentsTest
    rectangularPyramid.setHeightSegments pyramidHeightSegmentsTest
    pentagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    hexagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    heptagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    octagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    nonagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    decagonalPyramid.setHeightSegments pyramidHeightSegmentsTest
    cone.setHeightSegments pyramidHeightSegmentsTest

    log "### Open Ended Tests ###"

    pyramidOpenEndedTest1 = true
    pyramidOpenEndedTest2 = false

    pyramidOpenEndedTest = pyramidOpenEndedTest1

    log triangularPyramid.getOpenEnded()
    log rectangularPyramid.getOpenEnded()
    log pentagonalPyramid.getOpenEnded()
    log hexagonalPyramid.getOpenEnded()
    log heptagonalPyramid.getOpenEnded()
    log octagonalPyramid.getOpenEnded()
    log nonagonalPyramid.getOpenEnded()
    log decagonalPyramid.getOpenEnded()
    log cone.getOpenEnded()

    triangularPyramid.setOpenEnded pyramidOpenEndedTest
    rectangularPyramid.setOpenEnded pyramidOpenEndedTest
    pentagonalPyramid.setOpenEnded pyramidOpenEndedTest
    hexagonalPyramid.setOpenEnded pyramidOpenEndedTest
    heptagonalPyramid.setOpenEnded pyramidOpenEndedTest
    octagonalPyramid.setOpenEnded pyramidOpenEndedTest
    nonagonalPyramid.setOpenEnded pyramidOpenEndedTest
    decagonalPyramid.setOpenEnded pyramidOpenEndedTest
    cone.setOpenEnded pyramidOpenEndedTest

    log "### Theta Start Tests ###"

    pyramidThetaStartTest = 90

    log triangularPyramid.getThetaStart()
    log rectangularPyramid.getThetaStart()
    log pentagonalPyramid.getThetaStart()
    log hexagonalPyramid.getThetaStart()
    log heptagonalPyramid.getThetaStart()
    log octagonalPyramid.getThetaStart()
    log nonagonalPyramid.getThetaStart()
    log decagonalPyramid.getThetaStart()
    log cone.getThetaStart()

    triangularPyramid.setThetaStart pyramidThetaStartTest
    rectangularPyramid.setThetaStart pyramidThetaStartTest
    pentagonalPyramid.setThetaStart pyramidThetaStartTest
    hexagonalPyramid.setThetaStart pyramidThetaStartTest
    heptagonalPyramid.setThetaStart pyramidThetaStartTest
    octagonalPyramid.setThetaStart pyramidThetaStartTest
    nonagonalPyramid.setThetaStart pyramidThetaStartTest
    decagonalPyramid.setThetaStart pyramidThetaStartTest
    cone.setThetaStart pyramidThetaStartTest

    log "### Theta Length Tests ###"

    pyramidThetaLengthTest = 180

    log triangularPyramid.getThetaLength()
    log rectangularPyramid.getThetaLength()
    log pentagonalPyramid.getThetaLength()
    log hexagonalPyramid.getThetaLength()
    log heptagonalPyramid.getThetaLength()
    log octagonalPyramid.getThetaLength()
    log nonagonalPyramid.getThetaLength()
    log decagonalPyramid.getThetaLength()
    log cone.getThetaLength()

    triangularPyramid.setThetaLength pyramidThetaLengthTest
    rectangularPyramid.setThetaLength pyramidThetaLengthTest
    pentagonalPyramid.setThetaLength pyramidThetaLengthTest
    hexagonalPyramid.setThetaLength pyramidThetaLengthTest
    heptagonalPyramid.setThetaLength pyramidThetaLengthTest
    octagonalPyramid.setThetaLength pyramidThetaLengthTest
    nonagonalPyramid.setThetaLength pyramidThetaLengthTest
    decagonalPyramid.setThetaLength pyramidThetaLengthTest
    cone.setThetaLength pyramidThetaLengthTest

    log "### Type Tests ###"

    pyramidTypeTest = "cone"

    log triangularPyramid.getType()
    log rectangularPyramid.getType()
    log pentagonalPyramid.getType()
    log hexagonalPyramid.getType()
    log heptagonalPyramid.getType()
    log octagonalPyramid.getType()
    log nonagonalPyramid.getType()
    log decagonalPyramid.getType()
    log cone.getType()

    triangularPyramid.setType pyramidTypeTest
    rectangularPyramid.setType pyramidTypeTest
    pentagonalPyramid.setType pyramidTypeTest
    hexagonalPyramid.setType pyramidTypeTest
    heptagonalPyramid.setType pyramidTypeTest
    octagonalPyramid.setType pyramidTypeTest
    nonagonalPyramid.setType pyramidTypeTest
    decagonalPyramid.setType pyramidTypeTest
    cone.setType pyramidTypeTest
