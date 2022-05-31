import {addMesh} from "../../panels/mesh.mjs"

export async function localMeshes(action, mesh) {

  let localMeshes = localRead("meshes")

  if (action == "load") {

    if (localMeshes instanceof Array && localMeshes.length) {

      const loader = new THREE.ObjectLoader()

      localMeshes.forEach(localMesh => {

        addMesh(loader.parse(localMesh), {name: localMesh.metadata.name,
                                          lock: localMesh.metadata.lock,
                                          class: localMesh.metadata.class,
                                          style: localMesh.metadata.style})

      })

    }

  } else {

    mesh.updateMatrix()

    let meshJSON = mesh.toJSON()

    meshJSON.metadata.name = mesh.name
    meshJSON.metadata.lock = mesh.lock
    meshJSON.metadata.class = mesh.class
    meshJSON.metadata.style = mesh.material.style

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