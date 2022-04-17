function generator(maxLength=10) {

  for (let i = 1; i <= maxLength; i++) {

    data.title = "Bridging Test (" + i + " cm)"

    let bridgeLength = i * 10
    let bridgeWidth = 5

    let span = newBox(bridgeLength + (bridgeWidth * 2), bridgeWidth, bridgeWidth, [0, 0, bridgeWidth])

    let pillar0 = newBox(bridgeWidth, bridgeWidth, bridgeWidth * 3, [(bridgeLength / 2) + (bridgeWidth / 2), 0, 0])
    let pillar1 = newBox(bridgeWidth, bridgeWidth, bridgeWidth * 3, [ - ((bridgeLength / 2) + (bridgeWidth / 2)), 0, 0])

    let base = newBox(bridgeLength + (bridgeWidth * 3), bridgeWidth * 2, bridgeWidth, [0, 0, - bridgeWidth])

    let bridge = joinMesh(joinMesh(joinMesh(span, pillar0), pillar1), base)

    data.scene.add(bridge)
    exportSTL()
    data.scene.remove(bridge)

  }

}