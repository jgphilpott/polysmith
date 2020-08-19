export function degree2radian(degree) {

  return degree * (Math.PI / 180)

}

export function radian2degree(radian) {

  return radian * (180 / Math.PI)

}

export function getBoundingBox(mesh) {

  if (!mesh.geometry.boundingBox) {

    let xVertices = []
    let yVertices = []
    let zVertices = []

    for (let i = 0; i < mesh.geometry.vertices.length; i++) {

      xVertices.push(mesh.geometry.vertices[i].x)
      yVertices.push(mesh.geometry.vertices[i].y)
      zVertices.push(mesh.geometry.vertices[i].z)

    }

    return {

      "min": {"x": minValue(xVertices), "y": minValue(yVertices), "z": minValue(zVertices)},
      "max": {"x": maxValue(xVertices), "y": maxValue(yVertices), "z": maxValue(zVertices)}

    }

  } else {

    return mesh.geometry.boundingBox

  }

}
