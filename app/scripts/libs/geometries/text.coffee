# Link: https://threejs.org/docs/#examples/en/geometries/TextGeometry

newText = (text = "Text", size = 12, height = 3, bevel = false, font = "ubuntu", type = "normal", color = blackThree, center = true, x = 0, y = 0, z = 0, rotateX = 0, rotateY = 0, rotateZ = 180) ->

    params =

        font: font

        size: size
        height: height
        curveSegments: 12

        bevelEnabled: bevel
        bevelThickness: 1
        bevelSize: 1
        bevelOffset: 0
        bevelSegments: 3

    geometry = new THREE.TextBufferGeometry text, params
    material = new MeshMaterial type, color

    if center

        geometry.center()

    textMesh = new THREE.Mesh geometry, material

    textMesh.rotateX deg$rad rotateX
    textMesh.rotateY deg$rad rotateY
    textMesh.rotateZ deg$rad rotateZ

    textMesh.position.set x, y, z

    textMesh.class = "text"
    textMesh.name = "Text"

    return textMesh

addText = (text = "Text", size = 12, height = 3, bevel = false, font = "ubuntu", type = "normal", color = blackThree, center = true, x = 0, y = 0, z = 0, rotateX = 0, rotateY = 0, rotateZ = 180) ->

    loader = new THREE.FontLoader()

    loader.load "./app/fonts/JSON/" + font + ".json", (font) ->

        addMesh newText text, size, height, bevel, font, type, color, center, x, y, z, rotateX, rotateY, rotateZ
