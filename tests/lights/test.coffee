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
