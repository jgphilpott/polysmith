// Credit: https://stackoverflow.com/a/64777515/1544937
const chunkArray = (a,n)=>[...Array(Math.ceil(a.length/n))].map((_,i)=>a.slice(n*i,n+n*i))

// Credit: http://gist.github.com/399624
// The click event will be fired with a small delay but will not fire upon a double click.
$.fn.clickSingleDouble = function(single_click_callback, double_click_callback, delay=300) {
  return this.each(function(){
    var clicks = 0, self = this
    jQuery(this).click(function(event){
      clicks++
      if (clicks == 1) {
        setTimeout(function(){
          if(clicks == 1) {
            single_click_callback.call(self, event)
          } else {
            double_click_callback.call(self, event)
          }
          clicks = 0;
        }, delay)
      }
    })
  })
}

function signedVolumeOfTriangle(p1, p2, p3) {
  return p1.dot(p2.cross(p3)) / 6.0
}

function minValue(values=[]) {
  return Math.min.apply(null, values)
}

function maxValue(values=[]) {
  return Math.max.apply(null, values)
}

function absMinValue(values=[]) {
  return Math.min.apply(null, values.map(Math.abs))
}

function absMaxValue(values=[]) {
  return Math.max.apply(null, values.map(Math.abs))
}

function mm2inch(mm) {
  return mm / 25.4
}

function inch2mm(inch) {
  return inch * 25.4
}

function degree2radian(degree) {
  return degree * (Math.PI / 180)
}

function radian2degree(radian) {
  return radian * (180 / Math.PI)
}

function getBoundingBox(mesh) {

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

function centerX(boundingBox) {
  return - boundingBox.min.x - (Math.abs(boundingBox.max.x - boundingBox.min.x) / 2)
}

function centerY(boundingBox) {
  return - boundingBox.min.y - (Math.abs(boundingBox.max.y - boundingBox.min.y) / 2)
}

function centerZ(boundingBox) {
  return - boundingBox.min.z - (Math.abs(boundingBox.max.z - boundingBox.min.z) / 2)
}

// Credit: https://stackoverflow.com/a/13091694/1544937
function screen2worldCoordinates(x, y, zTarget=0) {

  let vector = new THREE.Vector3()
  let coordinates = new THREE.Vector3()

  vector.set((x / window.innerWidth) * 2 - 1, - (y / window.innerHeight) * 2 + 1, 0)

  vector.unproject(camera)

  vector.sub(camera.position).normalize()

  let distance = (zTarget - camera.position.z) / vector.z

  coordinates.copy(camera.position).add(vector.multiplyScalar(distance))

  return coordinates

}

// Credit: https://stackoverflow.com/a/36706930/1544937
function world2screenCoordinates(x, y, z) {

  let halfWidth = window.innerWidth / 2
  let halfHeight = window.innerHeight / 2

  let coordinates = new THREE.Vector3(x, y, z)

  coordinates.project(camera)

  coordinates.x = (coordinates.x * halfWidth) + halfWidth
  coordinates.y = - (coordinates.y * halfHeight) + halfHeight

  return new THREE.Vector2(coordinates.x, coordinates.y)

}

// Credit: https://stackoverflow.com/a/50937272/1544937
function getSurfaceArea(mesh) {

  let surface = 0
  let geometry = mesh.geometry

  if (geometry.faces && geometry.vertices) {

    for (let i = 0; i < geometry.faces.length; i++) {

      let v1 = geometry.vertices[geometry.faces[i].a]
      let v2 = geometry.vertices[geometry.faces[i].b]
      let v3 = geometry.vertices[geometry.faces[i].c]

      let p1 = new THREE.Vector3(v1.x, v1.y, v1.z)
      let p2 = new THREE.Vector3(v2.x, v2.y, v2.z)
      let p3 = new THREE.Vector3(v3.x, v3.y, v3.z)

      let triangle = new THREE.Triangle(p1, p2, p3)
      let area = triangle.getArea()

      surface += area

    }

  } else if (geometry.attributes.position.array) {

    let faces = chunkArray(geometry.attributes.position.array, 9)

    for (let i = 0; i < faces.length; i++) {

      let vertices = chunkArray(faces[i], 3)

      let v1 = vertices[0]
      let v2 = vertices[1]
      let v3 = vertices[2]

      let p1 = new THREE.Vector3(v1[0], v1[1], v1[2])
      let p2 = new THREE.Vector3(v2[0], v2[1], v2[2])
      let p3 = new THREE.Vector3(v3[0], v3[1], v3[2])

      let triangle = new THREE.Triangle(p1, p2, p3)
      let area = triangle.getArea()

      surface += area

    }

  }

  return surface

}

// Credit: https://discourse.threejs.org/t/volume-of-three-buffergeometry/5109
function getVolume(mesh) {

  let volume = 0
  let geometry = mesh.geometry

  let p1 = new THREE.Vector3()
  let p2 = new THREE.Vector3()
  let p3 = new THREE.Vector3()

  if (!geometry.isBufferGeometry) {

    try {

      geometry = new THREE.BufferGeometry().fromGeometry(geometry)

    } catch (error) {

      console.warn("The 'geometry' must be an indexed or non-indexed buffer geometry.")

      return null

    }

  }

  let isIndexed = geometry.index !== null
  let position = geometry.attributes.position

  if (!isIndexed) {

    let faces = position.count / 3

    for (let i = 0; i < faces; i++) {

      p1.fromBufferAttribute(position, i * 3 + 0)
      p2.fromBufferAttribute(position, i * 3 + 1)
      p3.fromBufferAttribute(position, i * 3 + 2)

      volume += signedVolumeOfTriangle(p1, p2, p3)

    }

  } else {

    let index = geometry.index
    let faces = index.count / 3

    for (let i = 0; i < faces; i++) {

      p1.fromBufferAttribute(position, index.array[i * 3 + 0])
      p2.fromBufferAttribute(position, index.array[i * 3 + 1])
      p3.fromBufferAttribute(position, index.array[i * 3 + 2])

      volume += signedVolumeOfTriangle(p1, p2, p3)

    }

  }

  return volume

}