polygen = ->

    log "### Setup ###"

    camera.setTarget x: 45, y: 0, z: 0
    camera.setPosition x: 45, y: 42, z: 42

    basic = new Sphere name: "Basic", material: "basic", color: blueThree, opacity: 50, position: {x: 30, y: 0, z: 0}
    depth = new Sphere name: "Depth", material: "depth", color: blueThree, opacity: 50, position: {x: 10, y: 0, z: 0}
    distance = new Sphere name: "Distance", material: "distance", color: blueThree, opacity: 50, position: {x: 0, y: 0, z: 0}
    lambert = new Sphere name: "Lambert", material: "lambert", color: blueThree, opacity: 50, position: {x: 80, y: 0, z: 0}
    matcap = new Sphere name: "Matcap", material: "matcap", color: blueThree, opacity: 50, position: {x: 40, y: 0, z: 0}
    normal = new Sphere name: "Normal", material: "normal", color: blueThree, opacity: 50, position: {x: 20, y: 0, z: 0}
    phong = new Sphere name: "Phong", material: "phong", color: blueThree, opacity: 50, position: {x: 70, y: 0, z: 0}
    physical = new Sphere name: "Physical", material: "physical", color: blueThree, opacity: 50, position: {x: 60, y: 0, z: 0}
    standard = new Sphere name: "Standard", material: "standard", color: blueThree, opacity: 50, position: {x: 50, y: 0, z: 0}
    toon = new Sphere name: "Toon", material: "toon", color: blueThree, opacity: 50, position: {x: 90, y: 0, z: 0}

    log basic.material
    log depth.material
    log distance.material
    log lambert.material
    log matcap.material
    log normal.material
    log phong.material
    log physical.material
    log standard.material
    log toon.material

    basic.add()
    depth.add()
    distance.add()
    lambert.add()
    matcap.add()
    normal.add()
    phong.add()
    physical.add()
    standard.add()
    toon.add()

    log "### Color Tests ###"

    materialsMeshColorTest1 = redThree
    materialsMeshColorTest2 = "#FFBF00"
    materialsMeshColorTest3 = "green"

    materialsMeshColorTest = materialsMeshColorTest1

    log basic.material.getColor()
    log depth.material.getColor()
    log distance.material.getColor()
    log lambert.material.getColor()
    log matcap.material.getColor()
    log normal.material.getColor()
    log phong.material.getColor()
    log physical.material.getColor()
    log standard.material.getColor()
    log toon.material.getColor()

    basic.material.setColor materialsMeshColorTest
    depth.material.setColor materialsMeshColorTest
    distance.material.setColor materialsMeshColorTest
    lambert.material.setColor materialsMeshColorTest
    matcap.material.setColor materialsMeshColorTest
    normal.material.setColor materialsMeshColorTest
    phong.material.setColor materialsMeshColorTest
    physical.material.setColor materialsMeshColorTest
    standard.material.setColor materialsMeshColorTest
    toon.material.setColor materialsMeshColorTest

    log "### Opacity Tests ###"

    materialsMeshOpacityTest1 = 100
    materialsMeshOpacityTest2 = 50
    materialsMeshOpacityTest3 = 0

    materialsMeshOpacityTest = materialsMeshOpacityTest1

    log basic.material.getOpacity()
    log depth.material.getOpacity()
    log distance.material.getOpacity()
    log lambert.material.getOpacity()
    log matcap.material.getOpacity()
    log normal.material.getOpacity()
    log phong.material.getOpacity()
    log physical.material.getOpacity()
    log standard.material.getOpacity()
    log toon.material.getOpacity()

    basic.material.setOpacity materialsMeshOpacityTest
    depth.material.setOpacity materialsMeshOpacityTest
    distance.material.setOpacity materialsMeshOpacityTest
    lambert.material.setOpacity materialsMeshOpacityTest
    matcap.material.setOpacity materialsMeshOpacityTest
    normal.material.setOpacity materialsMeshOpacityTest
    phong.material.setOpacity materialsMeshOpacityTest
    physical.material.setOpacity materialsMeshOpacityTest
    standard.material.setOpacity materialsMeshOpacityTest
    toon.material.setOpacity materialsMeshOpacityTest

    log "### Metalness Tests ###"

    materialsMeshMetalnessTest1 = 100
    materialsMeshMetalnessTest2 = 50
    materialsMeshMetalnessTest3 = 0

    materialsMeshMetalnessTest = materialsMeshMetalnessTest2

    log basic.material.getMetalness()
    log depth.material.getMetalness()
    log distance.material.getMetalness()
    log lambert.material.getMetalness()
    log matcap.material.getMetalness()
    log normal.material.getMetalness()
    log phong.material.getMetalness()
    log physical.material.getMetalness()
    log standard.material.getMetalness()
    log toon.material.getMetalness()

    basic.material.setMetalness materialsMeshMetalnessTest
    depth.material.setMetalness materialsMeshMetalnessTest
    distance.material.setMetalness materialsMeshMetalnessTest
    lambert.material.setMetalness materialsMeshMetalnessTest
    matcap.material.setMetalness materialsMeshMetalnessTest
    normal.material.setMetalness materialsMeshMetalnessTest
    phong.material.setMetalness materialsMeshMetalnessTest
    physical.material.setMetalness materialsMeshMetalnessTest
    standard.material.setMetalness materialsMeshMetalnessTest
    toon.material.setMetalness materialsMeshMetalnessTest

    log "### Roughness Tests ###"

    materialsMeshRoughnessTest1 = 100
    materialsMeshRoughnessTest2 = 50
    materialsMeshRoughnessTest3 = 0

    materialsMeshRoughnessTest = materialsMeshRoughnessTest2

    log basic.material.getRoughness()
    log depth.material.getRoughness()
    log distance.material.getRoughness()
    log lambert.material.getRoughness()
    log matcap.material.getRoughness()
    log normal.material.getRoughness()
    log phong.material.getRoughness()
    log physical.material.getRoughness()
    log standard.material.getRoughness()
    log toon.material.getRoughness()

    basic.material.setRoughness materialsMeshRoughnessTest
    depth.material.setRoughness materialsMeshRoughnessTest
    distance.material.setRoughness materialsMeshRoughnessTest
    lambert.material.setRoughness materialsMeshRoughnessTest
    matcap.material.setRoughness materialsMeshRoughnessTest
    normal.material.setRoughness materialsMeshRoughnessTest
    phong.material.setRoughness materialsMeshRoughnessTest
    physical.material.setRoughness materialsMeshRoughnessTest
    standard.material.setRoughness materialsMeshRoughnessTest
    toon.material.setRoughness materialsMeshRoughnessTest

    log "### Reflectivity Tests ###"

    materialsMeshReflectivityTest1 = 100
    materialsMeshReflectivityTest2 = 50
    materialsMeshReflectivityTest3 = 0

    materialsMeshReflectivityTest = materialsMeshReflectivityTest2

    log basic.material.getReflectivity()
    log depth.material.getReflectivity()
    log distance.material.getReflectivity()
    log lambert.material.getReflectivity()
    log matcap.material.getReflectivity()
    log normal.material.getReflectivity()
    log phong.material.getReflectivity()
    log physical.material.getReflectivity()
    log standard.material.getReflectivity()
    log toon.material.getReflectivity()

    basic.material.setReflectivity materialsMeshReflectivityTest
    depth.material.setReflectivity materialsMeshReflectivityTest
    distance.material.setReflectivity materialsMeshReflectivityTest
    lambert.material.setReflectivity materialsMeshReflectivityTest
    matcap.material.setReflectivity materialsMeshReflectivityTest
    normal.material.setReflectivity materialsMeshReflectivityTest
    phong.material.setReflectivity materialsMeshReflectivityTest
    physical.material.setReflectivity materialsMeshReflectivityTest
    standard.material.setReflectivity materialsMeshReflectivityTest
    toon.material.setReflectivity materialsMeshReflectivityTest

    log "### Transmission Tests ###"

    materialsMeshTransmissionTest1 = 100
    materialsMeshTransmissionTest2 = 50
    materialsMeshTransmissionTest3 = 0

    materialsMeshTransmissionTest = materialsMeshTransmissionTest3

    log basic.material.getTransmission()
    log depth.material.getTransmission()
    log distance.material.getTransmission()
    log lambert.material.getTransmission()
    log matcap.material.getTransmission()
    log normal.material.getTransmission()
    log phong.material.getTransmission()
    log physical.material.getTransmission()
    log standard.material.getTransmission()
    log toon.material.getTransmission()

    basic.material.setTransmission materialsMeshTransmissionTest
    depth.material.setTransmission materialsMeshTransmissionTest
    distance.material.setTransmission materialsMeshTransmissionTest
    lambert.material.setTransmission materialsMeshTransmissionTest
    matcap.material.setTransmission materialsMeshTransmissionTest
    normal.material.setTransmission materialsMeshTransmissionTest
    phong.material.setTransmission materialsMeshTransmissionTest
    physical.material.setTransmission materialsMeshTransmissionTest
    standard.material.setTransmission materialsMeshTransmissionTest
    toon.material.setTransmission materialsMeshTransmissionTest

    log "### Transparent Tests ###"

    materialsMeshTransparentTest1 = true
    materialsMeshTransparentTest2 = false

    materialsMeshTransparentTest = materialsMeshTransparentTest1

    log basic.material.getTransparent()
    log depth.material.getTransparent()
    log distance.material.getTransparent()
    log lambert.material.getTransparent()
    log matcap.material.getTransparent()
    log normal.material.getTransparent()
    log phong.material.getTransparent()
    log physical.material.getTransparent()
    log standard.material.getTransparent()
    log toon.material.getTransparent()

    basic.material.setTransparent materialsMeshTransparentTest
    depth.material.setTransparent materialsMeshTransparentTest
    distance.material.setTransparent materialsMeshTransparentTest
    lambert.material.setTransparent materialsMeshTransparentTest
    matcap.material.setTransparent materialsMeshTransparentTest
    normal.material.setTransparent materialsMeshTransparentTest
    phong.material.setTransparent materialsMeshTransparentTest
    physical.material.setTransparent materialsMeshTransparentTest
    standard.material.setTransparent materialsMeshTransparentTest
    toon.material.setTransparent materialsMeshTransparentTest

    log "### Wireframe Tests ###"

    materialsMeshWireframeTest1 = false
    materialsMeshWireframeTest2 = true

    materialsMeshWireframeTest = materialsMeshWireframeTest1

    log basic.material.getWireframe()
    log depth.material.getWireframe()
    log distance.material.getWireframe()
    log lambert.material.getWireframe()
    log matcap.material.getWireframe()
    log normal.material.getWireframe()
    log phong.material.getWireframe()
    log physical.material.getWireframe()
    log standard.material.getWireframe()
    log toon.material.getWireframe()

    basic.material.setWireframe materialsMeshWireframeTest
    depth.material.setWireframe materialsMeshWireframeTest
    distance.material.setWireframe materialsMeshWireframeTest
    lambert.material.setWireframe materialsMeshWireframeTest
    matcap.material.setWireframe materialsMeshWireframeTest
    normal.material.setWireframe materialsMeshWireframeTest
    phong.material.setWireframe materialsMeshWireframeTest
    physical.material.setWireframe materialsMeshWireframeTest
    standard.material.setWireframe materialsMeshWireframeTest
    toon.material.setWireframe materialsMeshWireframeTest

    log "### Side Tests ###"

    materialsMeshSideTest1 = THREE.DoubleSide
    materialsMeshSideTest2 = THREE.FrontSide
    materialsMeshSideTest3 = THREE.BackSide

    materialsMeshSideTest = materialsMeshSideTest1

    log basic.material.getSide()
    log depth.material.getSide()
    log distance.material.getSide()
    log lambert.material.getSide()
    log matcap.material.getSide()
    log normal.material.getSide()
    log phong.material.getSide()
    log physical.material.getSide()
    log standard.material.getSide()
    log toon.material.getSide()

    basic.material.setSide materialsMeshSideTest
    depth.material.setSide materialsMeshSideTest
    distance.material.setSide materialsMeshSideTest
    lambert.material.setSide materialsMeshSideTest
    matcap.material.setSide materialsMeshSideTest
    normal.material.setSide materialsMeshSideTest
    phong.material.setSide materialsMeshSideTest
    physical.material.setSide materialsMeshSideTest
    standard.material.setSide materialsMeshSideTest
    toon.material.setSide materialsMeshSideTest
