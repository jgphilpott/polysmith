function generator(name=true, logo=true, spikes=5) {

  let width = 80
  let height = 100
  let depth = 80
  let thickness = 2

  let angle = 45
  let offset = trig.side4angle(angle, height, true, null) * 1.2

  let blockExterior = newBox(width, depth, height, [0, 0, 0], red)
  let blockInterior = newBox(width - (thickness * 2), depth - (thickness * 2), height - (thickness * 2))

  let angleCut = newBox(height, height, height * 5, [0, offset, 0])
  angleCut.rotation.x = tools.degree2radian(angle)

  blockExterior = cutMesh(blockExterior, angleCut)
  angleCut.position.set(0, offset - (trig.side4angle(angle, thickness, true, null) * 2), 0)
  blockInterior = cutMesh(blockInterior, angleCut)

  let block = cutMesh(blockExterior, blockInterior)

  if (spikes == 1 || spikes == 5) {

    let primarySpike = newCylinder(height, 2, 0, [0, -height, 0])

    primarySpike.rotation.x = tools.degree2radian(90)

    block = joinMesh(block, primarySpike)

  }

  let spikeOffset = width / 4

  if (spikes == 4 || spikes == 5) {

    let secondarySpikeOne = newCylinder(height/2, 1.5, 0, [spikeOffset, -(height/2) - (height/4), spikeOffset])
    let secondarySpikeTwo = newCylinder(height/2, 1.5, 0, [-spikeOffset, -(height/2) - (height/4), spikeOffset])
    let secondarySpikeThree = newCylinder(height/2, 1.5, 0, [spikeOffset, -(height/2) - (height/4), -spikeOffset])
    let secondarySpikeFour = newCylinder(height/2, 1.5, 0, [-spikeOffset, -(height/2) - (height/4), -spikeOffset])

    secondarySpikeOne.rotation.x = tools.degree2radian(90)
    secondarySpikeTwo.rotation.x = tools.degree2radian(90)
    secondarySpikeThree.rotation.x = tools.degree2radian(90)
    secondarySpikeFour.rotation.x = tools.degree2radian(90)

    block = joinMesh(block, secondarySpikeOne)
    block = joinMesh(block, secondarySpikeTwo)
    block = joinMesh(block, secondarySpikeThree)
    block = joinMesh(block, secondarySpikeFour)

  }

  block.rotation.x = tools.degree2radian(-135)

  data.scene.add(block)

  if (name) {addName("Golf", "ubuntu", 16, 1.5, -25, 0)}
  if (logo) {addLogo("app/things/sports/golf/tee_block/logo.txt", 0.25, 1.5, 15, 0)}

  function addName(name="Golf", font="ubuntu", size=16, extrusion=1, vertical=0, horizontal=0) {

    let x = horizontal
    let y = trig.side4angle(angle, depth / 2, true, null) + trig.side4angle(angle, vertical, true, null)
    let z = trig.side4angle(angle, depth / 2, null, true) - trig.side4angle(angle, vertical, null, true)

    addText(name, size, extrusion * 2, false, font, true, x, y, z, -angle)

  }

  function addLogo(path="app/things/sports/golf/tee_block/logo.txt", scale=1, extrusion=1, vertical=0, horizontal=0) {

    $.get(path, function(svg) {

      let logo = importSVG(svg, extrusion * 10)

      logo.rotateX(tools.degree2radian(-angle))
      logo.rotateY(tools.degree2radian(0))
      logo.rotateZ(tools.degree2radian(180))

      let x = horizontal
      let y = trig.side4angle(angle, depth / 2, true, null) + trig.side4angle(angle, vertical, true, null)
      let z = trig.side4angle(angle, depth / 2, null, true) - trig.side4angle(angle, vertical, null, true)

      logo.position.set(x, y, z)

      logo.scale.x = scale
      logo.scale.y = scale
      logo.scale.z = scale

      data.scene.add(logo)

    })

  }

}
