polygen = (maxLength = 10) ->

  for i in [0...maxLength]

    data.title = "Bridging Test (" + i + " cm)"

    bridgeLength = i * 10
    bridgeWidth = 5

    span = newBox bridgeLength + (bridgeWidth * 2), bridgeWidth, bridgeWidth, [0, 0, bridgeWidth]

    pillar0 = newBox bridgeWidth, bridgeWidth, bridgeWidth * 3, [(bridgeLength / 2) + (bridgeWidth / 2), 0, 0]
    pillar1 = newBox bridgeWidth, bridgeWidth, bridgeWidth * 3, [ - ((bridgeLength / 2) + (bridgeWidth / 2)), 0, 0]

    base = newBox bridgeLength + (bridgeWidth * 3), bridgeWidth * 2, bridgeWidth, [0, 0, - bridgeWidth]

    bridge = join(join(join(span, pillar0), pillar1), base)

    data.scene.add bridge
    exportFile "STL"
    data.scene.remove bridge