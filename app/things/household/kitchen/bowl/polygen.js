function polygen(type="classic") {

  let radius = 75
  let thickness = 2
  var bowlSegments

  if (type == "classic") {
    bowlSegments = 50
  } else if (type == "polygon") {
    bowlSegments = 10
  }

  let bowl = newSphere(radius, bowlSegments, bowlSegments)
  let bowlCutout = newSphere(radius - thickness, bowlSegments, bowlSegments)
  let boxCutout = newBox(radius * 2, radius * 2, radius, [0, 0, -(radius * 1.333)])
  let lip = newTorus(radius - (thickness / 2), thickness, bowlSegments / 2, bowlSegments)

  lip.rotation.y = d$rad(0)
  bowl.rotation.x = d$rad(90)
  bowlCutout.rotation.x = d$rad(90)

  bowl = cutMesh(bowl, boxCutout)
  boxCutout.position.z += thickness
  bowlCutout = cutMesh(bowlCutout, boxCutout)

  boxCutout.position.z = radius / 2
  bowl = cutMesh(bowl, boxCutout)

  bowl = cutMesh(bowl, bowlCutout)

  scene.add(bowl)
  scene.add(lip)

}