function generator() {

  let width = 80
  let height = 100
  let depth = 80
  let thickness = 2

  let blockExterior = newBox(width, depth, height)
  let blockInterior = newBox(width - (thickness * 2), depth - (thickness * 2), height - (thickness * 2))

  let angle = 45
  let offset = trig.side4angle(45, height, true, null) * 1.2

  let angleCut = newBox(height, height, height * 5, [0, offset, 0])
  angleCut.rotation.x = tools.degree2radian(angle)

  blockExterior = cutMesh(blockExterior, angleCut)
  angleCut.position.set(0, offset - (trig.side4angle(45, thickness, true, null) * 2), 0)
  blockInterior = cutMesh(blockInterior, angleCut)

  let block = cutMesh(blockExterior, blockInterior)

  let spikeOffset = width / 4

  let primarySpike = newCylinder(height, 2, 0, [0, -height, 0])

  let secondarySpikeOne = newCylinder(height/2, 1.5, 0, [spikeOffset, -(height/2) - (height/4), spikeOffset])
  let secondarySpikeTwo = newCylinder(height/2, 1.5, 0, [-spikeOffset, -(height/2) - (height/4), spikeOffset])
  let secondarySpikeThree = newCylinder(height/2, 1.5, 0, [spikeOffset, -(height/2) - (height/4), -spikeOffset])
  let secondarySpikeFour = newCylinder(height/2, 1.5, 0, [-spikeOffset, -(height/2) - (height/4), -spikeOffset])

  primarySpike.rotation.x = tools.degree2radian(90)

  secondarySpikeOne.rotation.x = tools.degree2radian(90)
  secondarySpikeTwo.rotation.x = tools.degree2radian(90)
  secondarySpikeThree.rotation.x = tools.degree2radian(90)
  secondarySpikeFour.rotation.x = tools.degree2radian(90)

  block = joinMesh(block, primarySpike)

  block = joinMesh(block, secondarySpikeOne)
  block = joinMesh(block, secondarySpikeTwo)
  block = joinMesh(block, secondarySpikeThree)
  block = joinMesh(block, secondarySpikeFour)

  block.rotation.x = tools.degree2radian(-135)

  data.scene.add(block)

}
