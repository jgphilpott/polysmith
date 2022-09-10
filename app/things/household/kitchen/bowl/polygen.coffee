polygen = (type = "classic") ->

    radius = 75
    thickness = 2

    if type == "classic"
        bowlSegments = 50
    else if type == "polygon"
        bowlSegments = 10

    bowl = newSphere radius, bowlSegments, bowlSegments
    bowlCutout = newSphere radius - thickness, bowlSegments, bowlSegments
    boxCutout = newBox radius * 2, radius * 2, radius, [0, 0, - radius * 1.333]
    lip = newTorus radius - thickness / 2, thickness, bowlSegments / 2, bowlSegments

    lip.rotation.y = deg$rad 0
    bowl.rotation.x = deg$rad 90
    bowlCutout.rotation.x = deg$rad 90

    bowl = cut bowl, boxCutout
    boxCutout.position.z += thickness
    bowlCutout = cut bowlCutout, boxCutout

    boxCutout.position.z = radius / 2
    bowl = cut bowl, boxCutout

    bowl = cut bowl, bowlCutout

    scene.add bowl
    scene.add lip
