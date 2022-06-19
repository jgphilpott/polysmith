# Link: https://threejs.org/docs/#api/en/geometries/BoxGeometry

newBox = (length = 10, width = 10, height = 10, position = [0, 0, 0], material = "normal", color = blackThree) ->

    geometry = new THREE.BoxGeometry length, width, height
    box = new THREE.Mesh geometry, meshMaterial material, color

    box.position.set position[0], position[1], position[2]

    box.class = "box"
    box.name = "Box"

    return box

addBox = (length = 10, width = 10, height = 10, position = [0, 0, 0], material = "normal", color = blackThree) ->

    return window.addMesh newBox length, width, height, position, material, color
