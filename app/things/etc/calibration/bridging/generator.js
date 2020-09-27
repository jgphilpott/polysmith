function generator(bridgeLength=10) {

  let segments = bridgeLength * 2
  let segmentWidth = 5

  let baseWidth = ((segments * 2) - 1) * segmentWidth
  let baseLength = (bridgeLength * 10) + (segmentWidth * 2)
  let base = newBox(baseLength + segmentWidth, baseWidth + segmentWidth, segmentWidth, [baseLength / 2, baseWidth / 2, - (segmentWidth / 2)])

  for (let i = 0; i < segments; i++) {

    let pillar0 = newBox(segmentWidth, segmentWidth, segmentWidth * 3, [segmentWidth / 2, (segmentWidth / 2) + (i * 10), segmentWidth / 2])
    let pillar1 = newBox(segmentWidth, segmentWidth, segmentWidth * 3, [(segmentWidth / 2) + (i * segmentWidth) + (segmentWidth * 2), (segmentWidth / 2) + (i * 10), segmentWidth / 2])

    let bridgeLength = (segmentWidth * (i + 1)) + (segmentWidth * 2)
    let bridge = newBox(bridgeLength, segmentWidth, segmentWidth, [bridgeLength / 2, (segmentWidth / 2) + (i * 10), segmentWidth * 1.5])
    bridge = joinMesh(joinMesh(bridge, pillar0), pillar1)

    base = joinMesh(base, bridge)

  }

  data.scene.add(base)

}
