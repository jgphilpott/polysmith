polygen = ->

    log "### Setup ###"

    camera.reset()

    for light in lights by -1

        light.remove()

    dimensions = printer.getSize()

    x = dimensions.x / 4
    y = dimensions.y / 4
    z = dimensions.z / 4

    octant1 = new Sphere(color: grayThree, material: "standard", position: x: x, y: y, z: z).add()
    octant2 = new Sphere(color: grayThree, material: "standard", position: x: -x, y: y, z: z).add()
    octant3 = new Sphere(color: grayThree, material: "standard", position: x: -x, y: -y, z: z).add()
    octant4 = new Sphere(color: grayThree, material: "standard", position: x: x, y: -y, z: z).add()
    octant5 = new Sphere(color: grayThree, material: "standard", position: x: x, y: y, z: -z).add()
    octant6 = new Sphere(color: grayThree, material: "standard", position: x: -x, y: y, z: -z).add()
    octant7 = new Sphere(color: grayThree, material: "standard", position: x: -x, y: -y, z: -z).add()
    octant8 = new Sphere(color: grayThree, material: "standard", position: x: x, y: -y, z: -z).add()

    log ambient = new Light "ambient"
    log directional = new Light "directional"
    log hemisphere = new Light "hemisphere"
    log point = new Light "point"
    log spot = new Light "spot"

    log "### Ambient Tests ###"

    log ambient.add()

    ambient.setPosition x: 100, y: 100, z: 100
    log ambient.getPosition()

    ambient.setPositionX 0
    log ambient.getPositionX()

    ambient.setPositionY 0
    log ambient.getPositionY()

    ambient.setPositionZ 0
    log ambient.getPositionZ()

    ambient.setIntensity 0.5
    log ambient.getIntensity()

    ambient.setColor redThree
    log ambient.getColor()

    ambient.setLock true
    log ambient.getLock()
    ambient.toggleLock()
    log ambient.getLock()

    log ambient.remove()

    log "### Directional Tests ###"

    log directional.add()

    directional.setPosition x: -100, y: -100, z: -100
    log directional.getPosition()

    directional.setPositionX 100
    log directional.getPositionX()

    directional.setPositionY 100
    log directional.getPositionY()

    directional.setPositionZ 100
    log directional.getPositionZ()

    directional.setTarget x: 101, y: 101 , z: 101
    log directional.getTarget()

    directional.setTargetX 0
    log directional.getTargetX()

    directional.setTargetY 0
    log directional.getTargetY()

    directional.setTargetZ 0
    log directional.getTargetZ()

    directional.setIntensity 0.5
    log directional.getIntensity()

    directional.setColor redThree
    log directional.getColor()

    directional.setLock true
    log directional.getLock()
    directional.toggleLock()
    log directional.getLock()

    log directional.remove()

    log "### Hemisphere Tests ###"

    log hemisphere.add()

    hemisphere.setPosition x: -100, y: -100, z: -100
    log hemisphere.getPosition()

    hemisphere.setPositionX 100
    log hemisphere.getPositionX()

    hemisphere.setPositionY 100
    log hemisphere.getPositionY()

    hemisphere.setPositionZ 100
    log hemisphere.getPositionZ()

    hemisphere.setIntensity 0.5
    log hemisphere.getIntensity()

    hemisphere.setSkyColor redThree
    log hemisphere.getSkyColor()

    hemisphere.setGroundColor greenThree
    log hemisphere.getGroundColor()

    hemisphere.setLock true
    log hemisphere.getLock()
    hemisphere.toggleLock()
    log hemisphere.getLock()

    log hemisphere.remove()

    log "### Point Tests ###"

    log point.add()

    point.setPosition x: 0, y: 0, z: 0
    log point.getPosition()

    point.setPositionX 100
    log point.getPositionX()

    point.setPositionY 100
    log point.getPositionY()

    point.setPositionZ 100
    log point.getPositionZ()

    point.setDecay 0.5
    log point.getDecay()

    point.setDistance 100
    log point.getDistance()

    point.setIntensity 0.5
    log point.getIntensity()

    point.setColor redThree
    log point.getColor()

    point.setLock true
    log point.getLock()
    point.toggleLock()
    log point.getLock()

    log point.remove()

    log "### Spot Tests ###"

    log spot.add()

    spot.setPosition x: 1, y: 1, z: 1
    log spot.getPosition()

    spot.setPositionX 100
    log spot.getPositionX()

    spot.setPositionY 100
    log spot.getPositionY()

    spot.setPositionZ 100
    log spot.getPositionZ()

    spot.setTarget x: 101, y: 101 , z: 101
    log spot.getTarget()

    spot.setTargetX 0
    log spot.getTargetX()

    spot.setTargetY 0
    log spot.getTargetY()

    spot.setTargetZ 0
    log spot.getTargetZ()

    spot.setDecay 0.5
    log spot.getDecay()

    spot.setAngle 45
    log spot.getAngle()

    spot.setPenumbra 1
    log spot.getPenumbra()

    spot.setDistance 100
    log spot.getDistance()

    spot.setIntensity 0.5
    log spot.getIntensity()

    spot.setColor redThree
    log spot.getColor()

    spot.setLock true
    log spot.getLock()
    spot.toggleLock()
    log spot.getLock()

    log spot.remove()
