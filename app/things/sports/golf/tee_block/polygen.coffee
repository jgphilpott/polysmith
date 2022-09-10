polygen = (name = true, logo = true, spikes = 5) ->

    width = 80
    height = 100
    depth = 80
    thickness = 2

    angle = 45
    offset = side$angle(angle, height, true, null) * 1.2

    blockExterior = newBox width, depth, height
    blockInterior = newBox width - (thickness * 2), depth - (thickness * 2), height - (thickness * 2)

    angleCut = newBox height, height, height * 5, [0, offset, 0]
    angleCut.rotation.x = deg$rad angle

    blockExterior = cut blockExterior, angleCut
    angleCut.position.set 0, offset - (side$angle(angle, thickness, true, null) * 2), 0
    blockInterior = cut blockInterior, angleCut

    block = cut blockExterior, blockInterior

    if spikes == 1 or spikes == 5

        primarySpike = newCylinder(height, 4, 0, [0, - height, 0])

        primarySpike.rotation.x = deg$rad 90

        block = join block, primarySpike

    spikeOffset = width / 4

    if spikes == 4 or spikes == 5

        secondarySpikeOne = newCylinder height / 2, 3, 0, [spikeOffset, - (height / 2) - (height / 4), spikeOffset]
        secondarySpikeTwo = newCylinder height / 2, 3, 0, [- spikeOffset, - (height / 2) - (height / 4), spikeOffset]
        secondarySpikeThree = newCylinder height / 2, 3, 0, [spikeOffset, - (height / 2) - (height / 4), - spikeOffset]
        secondarySpikeFour = newCylinder height / 2, 3, 0, [- spikeOffset, - (height / 2) - (height / 4), - spikeOffset]

        secondarySpikeOne.rotation.x = deg$rad 90
        secondarySpikeTwo.rotation.x = deg$rad 90
        secondarySpikeThree.rotation.x = deg$rad 90
        secondarySpikeFour.rotation.x = deg$rad 90

        block = join block, secondarySpikeOne
        block = join block, secondarySpikeTwo
        block = join block, secondarySpikeThree
        block = join block, secondarySpikeFour

    block.rotation.x = deg$rad(- 135)

    data.scene.add block

    addName = (name = "Golf", font = "ubuntu", size = 16, extrusion = 1, vertical = 0, horizontal = 0) ->

        x = horizontal
        y = side$angle(angle, depth / 2, true, null) + side$angle(angle, vertical, true, null)
        z = side$angle(angle, depth / 2, null, true) - side$angle(angle, vertical, null, true)

        addText name, size, extrusion * 2, false, font, true, x, y, z, - angle

    addLogo = (path = "app/things/sports/golf/tee_block/logo.txt", scale = 1, extrusion = 1, vertical = 0, horizontal = 0) ->

        $.get path, (svg) ->

            logo = importSVG svg, extrusion * 10

            logo.rotateX deg$rad(- angle)
            logo.rotateY deg$rad(0)
            logo.rotateZ deg$rad(180)

            x = horizontal
            y = side$angle(angle, depth / 2, true, null) + side$angle(angle, vertical, true, null)
            z = side$angle(angle, depth / 2, null, true) - side$angle(angle, vertical, null, true)

            logo.position.set x, y, z

            logo.scale.x = scale
            logo.scale.y = scale
            logo.scale.z = scale

            data.scene.add logo

    if name

        addName "Golf", "ubuntu", 16, 1.5, -25, 0

    if logo

        addLogo "app/things/sports/golf/tee_block/logo.txt", 0.25, 1.5, 15, 0
