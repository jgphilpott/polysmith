polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    ring = new Ring name: "Ring", color: blueThree, position: x: 0, y: 0, z: 0

    log ring

    ring.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log ring.getMaterial()

    log ring.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log ring.getColor()

    ring.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log ring.getTransparent()

    ring.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log ring.getOpacity()

    ring.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log ring.getMetalness()

    ring.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log ring.getRoughness()

    ring.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log ring.getReflectivity()

    ring.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log ring.getTransmission()

    ring.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log ring.getWireframe()

    ring.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log ring.getSide()

    ring.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log ring.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log ring.getBoundingBox()

    log "### Buffer Tests ###"

    log ring.getBuffer()

    log ring.fromBuffer()

    log ring.toBuffer()

    log "### Surface Tests ###"

    log ring.getSurface()

    log "### Ring Tests ###"

    ring.setInnerRadius 21
    log ring.getInnerRadius()

    ring.setOuterRadius 42
    log ring.getOuterRadius()

    ring.setThetaSegments 8
    log ring.getThetaSegments()

    ring.setPhiSegments 2
    log ring.getPhiSegments()

    ring.setThetaStart 22.5
    log ring.getThetaStart()

    ring.setThetaLength 180
    log ring.getThetaLength()
