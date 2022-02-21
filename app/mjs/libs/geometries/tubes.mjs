// Link: https://threejs.org/docs/#api/en/geometries/TubeGeometry

import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newPath(vertices=[[]]) {

  let path = []

  for (let i = 0; i < vertices.length; i++) {

    path.push(new THREE.Vector3(vertices[i][0], vertices[i][1], vertices[i][2]))

  }

  return new THREE.CatmullRomCurve3(path)

}

export function newTube(vertices=[[10, 10, 10], [-10, -10, -10]], radius=1, radialSegments=10, tubularSegments=10, closed=false, material="normal", color=black) {

  let geometry = new THREE.TubeGeometry(newPath(vertices), tubularSegments, radius, radialSegments, closed)

  return new THREE.Mesh(geometry, meshMaterial(material, color))

}

export function addTube(vertices=[[10, 10, 10], [-10, -10, -10]], radius=1, radialSegments=10, tubularSegments=10, closed=false, material="normal", color=black) {

  let tube = newTube(vertices, radius, radialSegments, tubularSegments, closed, material, color)

  data.scene.add(tube)

  return tube

}