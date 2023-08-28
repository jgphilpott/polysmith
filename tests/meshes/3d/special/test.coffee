polygen = ->

    log "### Setup ###"

    camera.setTarget x: 0, y: 0, z: 42
    camera.setPosition x: 100, y: 100, z: 100

    capsule = new Capsule name: "Capsule", color: blueThree, position: x: 0, y: 0, z: 0
    image = new Image name: "Image", color: blueThree, position: x: 0, y: 0, z: 15
    knot = new Knot name: "Knot", color: blueThree, position: x: 0, y: 0, z: 30
    text = new Text name: "Text", color: blueThree, position: x: 0, y: 0, z: 45
    torus = new Torus name: "Torus", color: blueThree, position: x: 0, y: 0, z: 60
    tube = new Tube name: "Tube", color: blueThree, position: x: 0, y: 0, z: 75

    await sleep 1000

    log capsule
    log image
    log knot
    log text
    log torus
    log tube

    capsule.add()
    image.add()
    knot.add()
    text.add()
    torus.add()
    tube.add()

    log "### Material Tests ###"

    meshMaterialTest1 = "standard"
    meshMaterialTest2 = "normal"
    meshMaterialTest3 = "basic"

    meshMaterialTest = meshMaterialTest1

    log capsule.getMaterial()
    log image.getMaterial()
    log knot.getMaterial()
    log text.getMaterial()
    log torus.getMaterial()
    log tube.getMaterial()

    capsule.setMaterial meshMaterialTest
    image.setMaterial meshMaterialTest
    knot.setMaterial meshMaterialTest
    text.setMaterial meshMaterialTest
    torus.setMaterial meshMaterialTest
    tube.setMaterial meshMaterialTest

    log "### Color Tests ###"

    meshColorTest1 = redThree
    meshColorTest2 = "#FFBF00"
    meshColorTest3 = "green"
    meshColorTest4 = "multi"

    meshColorTest = meshColorTest1

    log capsule.getColor()
    log image.getColor()
    log knot.getColor()
    log text.getColor()
    log torus.getColor()
    log tube.getColor()

    capsule.setColor meshColorTest
    image.setColor meshColorTest
    knot.setColor meshColorTest
    text.setColor meshColorTest
    torus.setColor meshColorTest
    tube.setColor meshColorTest

    log "### Transparent Tests ###"

    meshTransparentTest1 = true
    meshTransparentTest2 = false

    meshTransparentTest = meshTransparentTest1

    log capsule.getTransparent()
    log image.getTransparent()
    log knot.getTransparent()
    log text.getTransparent()
    log torus.getTransparent()
    log tube.getTransparent()

    capsule.setTransparent meshTransparentTest
    image.setTransparent meshTransparentTest
    knot.setTransparent meshTransparentTest
    text.setTransparent meshTransparentTest
    torus.setTransparent meshTransparentTest
    tube.setTransparent meshTransparentTest

    log "### Opacity Tests ###"

    meshOpacityTest1 = 100
    meshOpacityTest2 = 50
    meshOpacityTest3 = 0

    meshOpacityTest = meshOpacityTest1

    log capsule.getOpacity()
    log image.getOpacity()
    log knot.getOpacity()
    log text.getOpacity()
    log torus.getOpacity()
    log tube.getOpacity()

    capsule.setOpacity meshOpacityTest
    image.setOpacity meshOpacityTest
    knot.setOpacity meshOpacityTest
    text.setOpacity meshOpacityTest
    torus.setOpacity meshOpacityTest
    tube.setOpacity meshOpacityTest

    log "### Metalness Tests ###"

    meshMetalnessTest1 = 100
    meshMetalnessTest2 = 50
    meshMetalnessTest3 = 0

    meshMetalnessTest = meshMetalnessTest2

    log capsule.getMetalness()
    log image.getMetalness()
    log knot.getMetalness()
    log text.getMetalness()
    log torus.getMetalness()
    log tube.getMetalness()

    capsule.setMetalness meshMetalnessTest
    image.setMetalness meshMetalnessTest
    knot.setMetalness meshMetalnessTest
    text.setMetalness meshMetalnessTest
    torus.setMetalness meshMetalnessTest
    tube.setMetalness meshMetalnessTest

    log "### Roughness Tests ###"

    meshRoughnessTest1 = 100
    meshRoughnessTest2 = 50
    meshRoughnessTest3 = 0

    meshRoughnessTest = meshRoughnessTest2

    log capsule.getRoughness()
    log image.getRoughness()
    log knot.getRoughness()
    log text.getRoughness()
    log torus.getRoughness()
    log tube.getRoughness()

    capsule.setRoughness meshRoughnessTest
    image.setRoughness meshRoughnessTest
    knot.setRoughness meshRoughnessTest
    text.setRoughness meshRoughnessTest
    torus.setRoughness meshRoughnessTest
    tube.setRoughness meshRoughnessTest

    log "### Reflectivity Tests ###"

    meshReflectivityTest1 = 100
    meshReflectivityTest2 = 50
    meshReflectivityTest3 = 0

    meshReflectivityTest = meshReflectivityTest2

    log capsule.getReflectivity()
    log image.getReflectivity()
    log knot.getReflectivity()
    log text.getReflectivity()
    log torus.getReflectivity()
    log tube.getReflectivity()

    capsule.setReflectivity meshReflectivityTest
    image.setReflectivity meshReflectivityTest
    knot.setReflectivity meshReflectivityTest
    text.setReflectivity meshReflectivityTest
    torus.setReflectivity meshReflectivityTest
    tube.setReflectivity meshReflectivityTest

    log "### Transmission Tests ###"

    meshTransmissionTest1 = 100
    meshTransmissionTest2 = 50
    meshTransmissionTest3 = 0

    meshTransmissionTest = meshTransmissionTest3

    log capsule.getTransmission()
    log image.getTransmission()
    log knot.getTransmission()
    log text.getTransmission()
    log torus.getTransmission()
    log tube.getTransmission()

    capsule.setTransmission meshTransmissionTest
    image.setTransmission meshTransmissionTest
    knot.setTransmission meshTransmissionTest
    text.setTransmission meshTransmissionTest
    torus.setTransmission meshTransmissionTest
    tube.setTransmission meshTransmissionTest

    log "### Wireframe Tests ###"

    meshWireframeTest1 = true
    meshWireframeTest2 = false

    meshWireframeTest = meshWireframeTest2

    log capsule.getWireframe()
    log image.getWireframe()
    log knot.getWireframe()
    log text.getWireframe()
    log torus.getWireframe()
    log tube.getWireframe()

    capsule.setWireframe meshWireframeTest
    image.setWireframe meshWireframeTest
    knot.setWireframe meshWireframeTest
    text.setWireframe meshWireframeTest
    torus.setWireframe meshWireframeTest
    tube.setWireframe meshWireframeTest

    log "### Side Tests ###"

    meshSideTest1 = THREE.DoubleSide
    meshSideTest2 = THREE.FrontSide
    meshSideTest3 = THREE.BackSide

    meshSideTest = meshSideTest1

    log capsule.getSide()
    log image.getSide()
    log knot.getSide()
    log text.getSide()
    log torus.getSide()
    log tube.getSide()

    capsule.setSide meshSideTest
    image.setSide meshSideTest
    knot.setSide meshSideTest
    text.setSide meshSideTest
    torus.setSide meshSideTest
    tube.setSide meshSideTest

    log "### Bounding Sphere Tests ###"

    log capsule.getBoundingSphere()
    log image.getBoundingSphere()
    log knot.getBoundingSphere()
    log text.getBoundingSphere()
    log torus.getBoundingSphere()
    log tube.getBoundingSphere()

    log "### Bounding Box Tests ###"

    log capsule.getBoundingBox()
    log image.getBoundingBox()
    log knot.getBoundingBox()
    log text.getBoundingBox()
    log torus.getBoundingBox()
    log tube.getBoundingBox()

    log "### Buffer Tests ###"

    log capsule.getBuffer()
    log image.getBuffer()
    log knot.getBuffer()
    log text.getBuffer()
    log torus.getBuffer()
    log tube.getBuffer()

    log capsule.fromBuffer()
    log image.fromBuffer()
    log knot.fromBuffer()
    log text.fromBuffer()
    log torus.fromBuffer()
    log tube.fromBuffer()

    log capsule.toBuffer()
    log image.toBuffer()
    log knot.toBuffer()
    log text.toBuffer()
    log torus.toBuffer()
    log tube.toBuffer()

    log "### Surface Tests ###"

    log capsule.getSurface()
    log image.getSurface()
    log knot.getSurface()
    log text.getSurface()
    log torus.getSurface()
    log tube.getSurface()

    log "### Volume Tests ###"

    log capsule.getVolume()
    log image.getVolume()
    log knot.getVolume()
    log text.getVolume()
    log torus.getVolume()
    log tube.getVolume()

    log "### Capsule Tests ###"

    capsule.setLength 10
    log capsule.getLength()

    capsule.setRadius 10
    log capsule.getRadius()

    capsule.setCapSegments 3
    log capsule.getCapSegments()

    capsule.setRadialSegments 6
    log capsule.getRadialSegments()

    log "### Image Tests ###"
    log "### Knot Tests ###"

    knot.setP 4
    log knot.getP()

    knot.setQ 6
    log knot.getQ()

    knot.setRadius 10
    log knot.getRadius()

    knot.setThickness 3
    log knot.getThickness()

    knot.setRadialSegments 3
    log knot.getRadialSegments()

    knot.setTubularSegments 12
    log knot.getTubularSegments()

    log "### Text Tests ###"
    log "### Torus Tests ###"

    torus.setArc 180
    log torus.getArc()

    torus.setRadius 10
    log torus.getRadius()

    torus.setThickness 3
    log torus.getThickness()

    torus.setRadialSegments 6
    log torus.getRadialSegments()

    torus.setTubularSegments 3
    log torus.getTubularSegments()

    log "### Tube Tests ###"

    tube.setClosed false
    log tube.getClosed()

    tube.setRadius 3
    log tube.getRadius()

    tube.setVertices [[10, -10, 10], [-10, 10, -10]]
    log tube.getVertices()

    tube.setRadialSegments 6
    log tube.getRadialSegments()

    tube.setTubularSegments 1
    log tube.getTubularSegments()
