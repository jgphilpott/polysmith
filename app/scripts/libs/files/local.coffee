localMeshes = (action, mesh) ->

    meshes = localRead "meshes"

    if action == "load"

        if meshes instanceof Array and meshes.length

            loader = new THREE.ObjectLoader()

            for mesh in meshes

                addMesh loader.parse(mesh),

                    name: mesh.metadata.name
                    lock: mesh.metadata.lock
                    class: mesh.metadata.class
                    style: mesh.metadata.style
                    wireframe: mesh.metadata.wireframe

    else

        mesh.updateMatrix()

        meshIndex = null
        meshJSON = mesh.toJSON()

        meshJSON.metadata.name = mesh.name
        meshJSON.metadata.lock = mesh.lock
        meshJSON.metadata.class = mesh.class
        meshJSON.metadata.style = mesh.material.style
        meshJSON.metadata.wireframe = mesh.material.wireframe

        if action == "add"

            if meshes instanceof Array and not meshes.find (localMesh) -> localMesh.object.uuid == mesh.uuid

                meshes.push meshJSON

            else

                meshes = [meshJSON]

        else if action == "update"

            meshIndex = meshes.findIndex (localMesh) -> localMesh.object.uuid == mesh.uuid

            meshes[meshIndex] = meshJSON

        else if action == "remove"

            meshes.filterInPlace (localMesh) -> localMesh.object.uuid != mesh.uuid

        if not localWrite("meshes", meshes) or (action == "update" and meshIndex < 0)

            console.warn "You have reached the maximum local storage allowance, some of your changes may not be saved. To access more storage space please signup and/or login."
