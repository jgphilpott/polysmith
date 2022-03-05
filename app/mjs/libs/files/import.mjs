import {meshMaterial} from "../materials/mesh.mjs"

export function importFile(type, path, properties={}) {

  let mesh = null
  let loader = null
  let material = meshMaterial()

  switch (type) {

    case "3mf":
      loader = new THREE.ThreeMFLoader()
      break

    case "amf":
      loader = new THREE.AMFLoader()
      break

    case "collada":
      loader = new THREE.ColladaLoader()
      break

    case "draco":
      loader = new THREE.DRACOLoader()
      break

    case "fbx":
      loader = new THREE.FBXLoader()
      break

    case "gltf":
      loader = new THREE.GLTFLoader()
      break

    case "mmd":
      loader = new THREE.MMDLoader()
      break

    case "obj":
      loader = new THREE.OBJLoader()
      break

    case "ply":
      loader = new THREE.PLYLoader()
      break

    case "stl":
      loader = new THREE.STLLoader()
      break

    case "svg":
      loader = new THREE.SVGLoader()
      break

    case "vrml":
      loader = new THREE.VRMLLoader()
      break

  }

  if (type == "svg") {

    $.get(path, function(svg) {

      let shapes = []
      let paths = loader.parse(svg).paths

      for (let i = 0; i < paths.length; i ++) {
        Array.prototype.push.apply(shapes, paths[i].toShapes())
      }

      let geometry = new THREE.ExtrudeBufferGeometry(shapes, properties)
      mesh = new THREE.Mesh(geometry, material)

      data.meshes.push(mesh)
      data.scene.add(mesh)

      return mesh

    })

  } else {

    loader.load(path, function(object) {

      if (type == "obj") {

        object.traverse(function(property) {

            if (property instanceof THREE.Mesh) {

                mesh = property
                mesh.material = material

            }

        })

      } else {

        mesh = new THREE.Mesh(object, material)

      }

      data.meshes.push(mesh)
      data.scene.add(mesh)

      return mesh

    })

  }

}