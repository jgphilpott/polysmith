import {addMesh} from "../../panels/mesh.mjs"

export async function localMeshes(action=null, mesh=null) {

  let localMeshes = localRead("meshes")

  if (action == "load") {

    if (localMeshes instanceof Array && localMeshes.length > 0) {

      const loader = new THREE.ObjectLoader()

      localMeshes.forEach(localMesh => {

        addMesh(loader.parse(localMesh), {name: localMesh.object.name,
                                          lock: localMesh.object.lock,
                                          class: localMesh.object.class})

      })

    }

  } else {

    mesh.updateMatrix()

    let meshJSON = mesh.toJSON()

    meshJSON.object.name = mesh.name
    meshJSON.object.lock = mesh.lock
    meshJSON.object.class = mesh.class

    if (action == "add") {

      if (localMeshes instanceof Array) {

        if (!localMeshes.find(localMesh => localMesh.object.uuid == mesh.uuid)) localMeshes.push(meshJSON)

      } else {

        localMeshes = [meshJSON]

      }

    } else if (action == "update") {

      localMeshes[localMeshes.findIndex(localMesh => localMesh.object.uuid == mesh.uuid)] = meshJSON

    } else if (action == "remove") {

      localMeshes.filterInPlace(localMesh => localMesh.object.uuid != mesh.uuid)

    }

    localWrite("meshes", localMeshes)

  }

}