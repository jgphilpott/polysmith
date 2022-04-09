import {addMesh} from "../../panels/mesh.mjs"

export async function localMeshes(action=null, mesh=null) {

  let localMeshes = localRead("meshes")

  if (action == "load") {

    if (localMeshes instanceof Array && localMeshes.length > 0) {

      const loader = new THREE.ObjectLoader()

      localMeshes.forEach((mesh, index) => {

        addMesh(loader.parse(mesh))

      })

    }

  } else {

    mesh.updateMatrix()

    if (action == "add") {

      if (localMeshes instanceof Array) {

        if (!localMeshes.find(localMesh => localMesh.object.uuid == mesh.uuid)) localMeshes.push(mesh.toJSON())

      } else {

        localMeshes = [mesh.toJSON()]

      }

    } else if (action == "update") {

      localMeshes[localMeshes.findIndex(localMesh => localMesh.object.uuid == mesh.uuid)] = mesh.toJSON()

    } else if (action == "remove") {

      localMeshes = localMeshes.filter(localMesh => localMesh.object.uuid != mesh.uuid)

    }

    localWrite("meshes", localMeshes)

  }

}