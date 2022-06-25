lineMaterial = (type = "basic", color = blackThree, linewidth = 1, dashed = false, dashSize = 3, gapSize = 2, vertexColors = false, alphaToCoverage = false) ->

    material = null

    switch type

        when "basic"

            material = new THREE.LineBasicMaterial color: color, linewidth: linewidth; break

        when "dashed"

            material = new THREE.LineDashedMaterial color: color, linewidth: linewidth, dashSize: dashSize, gapSize: gapSize; break

        when "thick"

            material = new LineMaterial color: color, linewidth: linewidth, dashed: dashed, vertexColors: vertexColors, alphaToCoverage: alphaToCoverage; break

    if material

        material.transparent = true

        if type == "thick"

            material.resolution.set window.innerWidth, window.innerHeight

    return material
