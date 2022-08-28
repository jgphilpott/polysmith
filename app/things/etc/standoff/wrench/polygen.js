function polygen(size) {

  let wrench = newCylinder(size, size * 2, size * 2, [0, 0, 0], black, 6)
  let bolt = newCylinder(size, size, size, [0, 0, 0], black, 6)

  let handel = newBox(size, size, size * 4, [0, 0, -(size * 2)], black)
  let handelCap = newCylinder(size, size / 2, size / 2, [0, 0, -(size * 4)], black, 42)

  wrench = cutMesh(wrench, bolt)
  handel = cutMesh(handel, bolt)

  bolt.position.set(0, 0, size)

  wrench = joinMesh(joinMesh(cutMesh(wrench, bolt), handel), handelCap).rotateX(tools.d$rad(90))

  data.scene.add(wrench)

}