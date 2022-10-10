meshMaterial = (type = "normal", color = blackThree, texture = null, side = THREE.DoubleSide) ->

    material = null

    switch type

        when "basic"

            material = new THREE.MeshBasicMaterial color: color, map: texture, side: side; break

        when "depth"

            material = new THREE.MeshDepthMaterial side: side; break

        when "distance"

            material = new THREE.MeshDistanceMaterial side: side; break

        when "lambert"

            material = new THREE.MeshLambertMaterial color: color, map: texture, side: side; break

        when "matcap"

            material = new THREE.MeshMatcapMaterial color: color, map: texture, side: side; break

        when "normal"

            material = new THREE.MeshNormalMaterial side: side; break

        when "phong"

            material = new THREE.MeshPhongMaterial color: color, map: texture, side: side; break

        when "physical"

            material = new THREE.MeshPhysicalMaterial color: color, map: texture, side: side; break

        when "standard"

            material = new THREE.MeshStandardMaterial color: color, map: texture, side: side; break

        when "toon"

            material = new THREE.MeshToonMaterial color: color, map: texture, side: side; break

    if material

        material.transparent = true

        if color == blackThree

            material.metalness = - 25
            material.roughness = 0.75

        else

            material.metalness = 0.5
            material.roughness = 0.5

    return material
