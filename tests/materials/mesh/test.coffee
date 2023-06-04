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
    phong = new Sphere name: "Phong", material: "phong", color: blueThree, opacity: 50, position: {x: 50, y: 0, z: 0}
    physical = new Sphere name: "Physical", material: "physical", color: blueThree, opacity: 50, position: {x: 60, y: 0, z: 0}
    standard = new Sphere name: "Standard", material: "standard", color: blueThree, opacity: 50, position: {x: 70, y: 0, z: 0}
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
