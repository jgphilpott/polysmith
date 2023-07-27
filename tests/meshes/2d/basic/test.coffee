polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 0
    camera.setPosition x: 42, y: 42, z: 42

    circle = new Circle name: "Circle", color: blueThree, position: x: 0, y: 0, z: 10
    plane = new Plane name: "Plane", color: blueThree, position: x: 0, y: 0, z: -10

    log circle
    log plane

    circle.add()
    plane.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log circle.getMaterial()
    log plane.getMaterial()

    log circle.setMaterial meshMaterialTest
    log plane.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log circle.getColor()
    log plane.getColor()

    circle.setColor meshColorTest
    plane.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log circle.getTransparent()
    log plane.getTransparent()

    circle.setTransparent meshTransparentTest
    plane.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log circle.getOpacity()
    log plane.getOpacity()

    circle.setOpacity meshOpacityTest
    plane.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log circle.getMetalness()
    log plane.getMetalness()

    circle.setMetalness meshMetalnessTest
    plane.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log circle.getRoughness()
    log plane.getRoughness()

    circle.setRoughness meshRoughnessTest
    plane.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log circle.getReflectivity()
    log plane.getReflectivity()

    circle.setReflectivity meshReflectivityTest
    plane.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log circle.getTransmission()
    log plane.getTransmission()

    circle.setTransmission meshTransmissionTest
    plane.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log circle.getWireframe()
    log plane.getWireframe()

    circle.setWireframe meshWireframeTest
    plane.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log circle.getSide()
    log plane.getSide()

    circle.setSide meshSideTest
    plane.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log circle.getBoundingSphere()
    log plane.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log circle.getBoundingBox()
    log plane.getBoundingBox()

    log "### Buffer Tests ###"

    log circle.getBuffer()
    log plane.getBuffer()

    log circle.fromBuffer()
    log plane.fromBuffer()

    log circle.toBuffer()
    log plane.toBuffer()

    log "### Surface Tests ###"

    log circle.getSurface()
    log plane.getSurface()

    log "### Circle Tests ###"

    circle.setRadius 21
    log circle.getRadius()

    circle.setSegments 3
    log circle.getSegments()

    circle.setThetaStart 90
    log circle.getThetaStart()

    circle.setThetaLength 180
    log circle.getThetaLength()

    log "### Plane Tests ###"

    plane.setWidth 42
    log plane.getWidth()

    plane.setHeight 42
    log plane.getHeight()

    plane.setWidthSegments 3
    log plane.getWidthSegments()

    plane.setHeightSegments 3
    log plane.getHeightSegments()
