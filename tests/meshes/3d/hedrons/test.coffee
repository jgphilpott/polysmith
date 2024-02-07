polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    octahedron = new Octahedron name: "Octahedron", color: blueThree, position: x: 0, y: 0, z: 15
    dodecahedron = new Dodecahedron name: "Dodecahedron", color: blueThree, position: x: 0, y: 0, z: 0
    icosahedron = new Icosahedron name: "Icosahedron", color: blueThree, position: x: 0, y: 0, z: -15

    log octahedron
    log dodecahedron
    log icosahedron

    octahedron.add()
    dodecahedron.add()
    icosahedron.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log octahedron.getMaterial()
    log dodecahedron.getMaterial()
    log icosahedron.getMaterial()

    octahedron.setMaterial meshMaterialTest
    dodecahedron.setMaterial meshMaterialTest
    icosahedron.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log octahedron.getColor()
    log dodecahedron.getColor()
    log icosahedron.getColor()

    octahedron.setColor meshColorTest
    dodecahedron.setColor meshColorTest
    icosahedron.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log octahedron.getTransparent()
    log dodecahedron.getTransparent()
    log icosahedron.getTransparent()

    octahedron.setTransparent meshTransparentTest
    dodecahedron.setTransparent meshTransparentTest
    icosahedron.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log octahedron.getOpacity()
    log dodecahedron.getOpacity()
    log icosahedron.getOpacity()

    octahedron.setOpacity meshOpacityTest
    dodecahedron.setOpacity meshOpacityTest
    icosahedron.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log octahedron.getMetalness()
    log dodecahedron.getMetalness()
    log icosahedron.getMetalness()

    octahedron.setMetalness meshMetalnessTest
    dodecahedron.setMetalness meshMetalnessTest
    icosahedron.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log octahedron.getRoughness()
    log dodecahedron.getRoughness()
    log icosahedron.getRoughness()

    octahedron.setRoughness meshRoughnessTest
    dodecahedron.setRoughness meshRoughnessTest
    icosahedron.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log octahedron.getReflectivity()
    log dodecahedron.getReflectivity()
    log icosahedron.getReflectivity()

    octahedron.setReflectivity meshReflectivityTest
    dodecahedron.setReflectivity meshReflectivityTest
    icosahedron.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log octahedron.getTransmission()
    log dodecahedron.getTransmission()
    log icosahedron.getTransmission()

    octahedron.setTransmission meshTransmissionTest
    dodecahedron.setTransmission meshTransmissionTest
    icosahedron.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log octahedron.getWireframe()
    log dodecahedron.getWireframe()
    log icosahedron.getWireframe()

    octahedron.setWireframe meshWireframeTest
    dodecahedron.setWireframe meshWireframeTest
    icosahedron.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log octahedron.getSide()
    log dodecahedron.getSide()
    log icosahedron.getSide()

    octahedron.setSide meshSideTest
    dodecahedron.setSide meshSideTest
    icosahedron.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log octahedron.getBoundingSphere()
    log dodecahedron.getBoundingSphere()
    log icosahedron.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log octahedron.getBoundingBox()
    log dodecahedron.getBoundingBox()
    log icosahedron.getBoundingBox()

    log "### Buffer Tests ###"

    log octahedron.getBuffer()
    log dodecahedron.getBuffer()
    log icosahedron.getBuffer()

    log octahedron.fromBuffer()
    log dodecahedron.fromBuffer()
    log icosahedron.fromBuffer()

    log octahedron.toBuffer()
    log dodecahedron.toBuffer()
    log icosahedron.toBuffer()

    log "### Surface Tests ###"

    log octahedron.getSurface()
    log dodecahedron.getSurface()
    log icosahedron.getSurface()

    log "### Volume Tests ###"

    log octahedron.getVolume()
    log dodecahedron.getVolume()
    log icosahedron.getVolume()

    log "### Radius Tests ###"

    hedronRadiusTest = 7

    log octahedron.getRadius()
    log dodecahedron.getRadius()
    log icosahedron.getRadius()

    octahedron.setRadius hedronRadiusTest
    dodecahedron.setRadius hedronRadiusTest
    icosahedron.setRadius hedronRadiusTest

    log "### Detail Tests ###"

    hedronDetailTest = 1

    log octahedron.getDetail()
    log dodecahedron.getDetail()
    log icosahedron.getDetail()

    octahedron.setDetail hedronDetailTest
    dodecahedron.setDetail hedronDetailTest
    icosahedron.setDetail hedronDetailTest

    log "### Type Tests ###"

    hedronTypeTest1 = "octahedron"
    hedronTypeTest2 = "dodecahedron"
    hedronTypeTest3 = "icosahedron"

    hedronTypeTest = hedronTypeTest1

    log octahedron.getType()
    log dodecahedron.getType()
    log icosahedron.getType()

    octahedron.setType hedronTypeTest
    dodecahedron.setType hedronTypeTest
    icosahedron.setType hedronTypeTest
