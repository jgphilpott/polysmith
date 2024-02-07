polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    box = new Box name: "Box", color: blueThree, position: x: 0, y: 0, z: 15
    cylinder = new Cylinder name: "Cylinder", color: blueThree, position: x: 0, y: 0, z: 0
    sphere = new Sphere name: "Sphere", color: blueThree, position: x: 0, y: 0, z: -15

    log box
    log cylinder
    log sphere

    box.add()
    cylinder.add()
    sphere.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log box.getMaterial()
    log cylinder.getMaterial()
    log sphere.getMaterial()

    box.setMaterial meshMaterialTest
    cylinder.setMaterial meshMaterialTest
    sphere.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log box.getColor()
    log cylinder.getColor()
    log sphere.getColor()

    box.setColor meshColorTest
    cylinder.setColor meshColorTest
    sphere.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log box.getTransparent()
    log cylinder.getTransparent()
    log sphere.getTransparent()

    box.setTransparent meshTransparentTest
    cylinder.setTransparent meshTransparentTest
    sphere.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log box.getOpacity()
    log cylinder.getOpacity()
    log sphere.getOpacity()

    box.setOpacity meshOpacityTest
    cylinder.setOpacity meshOpacityTest
    sphere.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log box.getMetalness()
    log cylinder.getMetalness()
    log sphere.getMetalness()

    box.setMetalness meshMetalnessTest
    cylinder.setMetalness meshMetalnessTest
    sphere.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log box.getRoughness()
    log cylinder.getRoughness()
    log sphere.getRoughness()

    box.setRoughness meshRoughnessTest
    cylinder.setRoughness meshRoughnessTest
    sphere.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log box.getReflectivity()
    log cylinder.getReflectivity()
    log sphere.getReflectivity()

    box.setReflectivity meshReflectivityTest
    cylinder.setReflectivity meshReflectivityTest
    sphere.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log box.getTransmission()
    log cylinder.getTransmission()
    log sphere.getTransmission()

    box.setTransmission meshTransmissionTest
    cylinder.setTransmission meshTransmissionTest
    sphere.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log box.getWireframe()
    log cylinder.getWireframe()
    log sphere.getWireframe()

    box.setWireframe meshWireframeTest
    cylinder.setWireframe meshWireframeTest
    sphere.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log box.getSide()
    log cylinder.getSide()
    log sphere.getSide()

    box.setSide meshSideTest
    cylinder.setSide meshSideTest
    sphere.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log box.getBoundingSphere()
    log cylinder.getBoundingSphere()
    log sphere.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log box.getBoundingBox()
    log cylinder.getBoundingBox()
    log sphere.getBoundingBox()

    log "### Buffer Tests ###"

    log box.getBuffer()
    log cylinder.getBuffer()
    log sphere.getBuffer()

    log box.fromBuffer()
    log cylinder.fromBuffer()
    log sphere.fromBuffer()

    log box.toBuffer()
    log cylinder.toBuffer()
    log sphere.toBuffer()

    log "### Surface Tests ###"

    log box.getSurface()
    log cylinder.getSurface()
    log sphere.getSurface()

    log "### Volume Tests ###"

    log box.getVolume()
    log cylinder.getVolume()
    log sphere.getVolume()

    log "### Box Tests ###"

    box.setWidth 5
    log box.getWidth()

    box.setLength 5
    log box.getLength()

    box.setHeight 5
    log box.getHeight()

    box.setWidthSegments 3
    log box.getWidthSegments()

    box.setLengthSegments 3
    log box.getLengthSegments()

    box.setHeightSegments 3
    log box.getHeightSegments()

    log "### Cylinder Tests ###"

    cylinder.setLength 5
    log cylinder.getLength()

    cylinder.setPositiveRadius 10
    log cylinder.getPositiveRadius()

    cylinder.setNegativeRadius 10
    log cylinder.getNegativeRadius()

    cylinder.setRadialSegments 8
    log cylinder.getRadialSegments()

    cylinder.setLengthSegments 3
    log cylinder.getLengthSegments()

    cylinder.setOpenEnded true
    log cylinder.getOpenEnded()

    cylinder.setThetaStart 90
    log cylinder.getThetaStart()

    cylinder.setThetaLength 180
    log cylinder.getThetaLength()

    log "### Sphere Tests ###"

    sphere.setRadius 10
    log sphere.getRadius()

    sphere.setThetaSegments 8
    log sphere.getThetaSegments()

    sphere.setPhiSegments 8
    log sphere.getPhiSegments()

    sphere.setThetaStart 90
    log sphere.getThetaStart()

    sphere.setThetaLength 180
    log sphere.getThetaLength()

    sphere.setPhiStart 45
    log sphere.getPhiStart()

    sphere.setPhiLength 90
    log sphere.getPhiLength()
