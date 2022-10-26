class LocalStorage

    constructor : () ->

        return

    keys : () ->

        return localKeys()

    write : (key, value) ->

        result = localWrite key, value

        if not result

            console.warn "You have reached the maximum local storage allowance, some of your changes may not be saved. To access more storage space please signup and/or login."

            return false

        else

            return value

    read : (key) ->

        result = localRead key

        if not result

            console.warn "There was an error attempting to read item in local storage with key: " + key

            return false

        else

            return result

    delete : (key) ->

        result = localDelete key

        if not result

            console.warn "There was an error attempting to delete item in local storage with key: " + key

            return false

        else

            return key

    dump : () ->

        return localDump()

    addMeshes : (mesh) ->

        mesh = serializeMesh mesh
        meshes = this.read "meshes"

        if not meshes.find (localMesh) -> localMesh.object.uuid == mesh.object.uuid

            meshes.push mesh

            this.write "meshes", meshes

    updateMeshes : (mesh) ->

        mesh = serializeMesh mesh
        meshes = this.read "meshes"

        meshIndex = meshes.findIndex (localMesh) -> localMesh.object.uuid == mesh.object.uuid

        if meshIndex >= 0

            meshes[meshIndex] = mesh

            this.write "meshes", meshes

    loadMeshes : () ->

        meshes = this.read "meshes"

        if meshes.length

            this.write "meshes", []

            for mesh in meshes

                mesh = deserializeMesh mesh

                if mesh.class == "text"

                    addText()

                else

                    addMesh mesh

    removeMeshes : (mesh) ->

        mesh = serializeMesh mesh
        meshes = this.read "meshes"

        meshes.filterInPlace (localMesh) -> localMesh.object.uuid != mesh.object.uuid

        this.write "meshes", meshes
