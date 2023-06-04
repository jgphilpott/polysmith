polygen = ->

    log "### Setup ###"

    camera.setTarget x: 45, y: 0, z: 0
    camera.setPosition x: 45, y: 42, z: 42

    basic = new Sphere material: "basic", position: {x: 0, y: 0, z: 0}
    depth = new Sphere material: "depth", position: {x: 10, y: 0, z: 0}
    distance = new Sphere material: "distance", position: {x: 20, y: 0, z: 0}
    lambert = new Sphere material: "lambert", position: {x: 30, y: 0, z: 0}
    matcap = new Sphere material: "matcap", position: {x: 40, y: 0, z: 0}
    normal = new Sphere material: "normal", position: {x: 50, y: 0, z: 0}
    phong = new Sphere material: "phong", position: {x: 60, y: 0, z: 0}
    physical = new Sphere material: "physical", position: {x: 70, y: 0, z: 0}
    standard = new Sphere material: "standard", position: {x: 80, y: 0, z: 0}
    toon = new Sphere material: "toon", position: {x:90, y: 0, z: 0}

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
