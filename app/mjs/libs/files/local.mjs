import {addMesh} from "../../panels/mesh.mjs"

export async function localMeshes(action=null, mesh=null) {

  if (action == "load") {

    let localMeshes = localRead("meshes")

    if (localMeshes && localMeshes.length > 0) {

      const loader = new THREE.ObjectLoader()

      localMeshes.forEach((mesh, index) => {

        addMesh(loader.parse(mesh), {position: mesh.position, rotation: mesh.rotation})

      })

    }

  } else {

    let localMeshes = []

    meshes.forEach((mesh, index) => {

      let meshJSON = mesh.toJSON()

      meshJSON.position = mesh.position
      meshJSON.rotation = mesh.rotation

      localMeshes.push(meshJSON)

    });

    localWrite("meshes", localMeshes)

  }

}