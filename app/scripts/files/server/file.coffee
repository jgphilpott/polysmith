class ServerStorage

    constructor: ->

        return

    loadMeshes: ->

        # meshes = this.read "meshes"
        #
        # if meshes.length
        #
        #     this.write "meshes", []
        #
        #     for mesh in meshes
        #
        #         if mesh.metadata.class is "text"
        #
        #             mesh = new Text()
        #
        #         else
        #
        #             mesh = new Mesh "refresh", mesh: deserializeMesh mesh
        #
        #         mesh.add()

    addMesh: (mesh) ->

        # mesh = serializeMesh mesh
        # meshes = this.read "meshes"
        #
        # if not meshes.find (localMesh) => localMesh.object.uuid is mesh.object.uuid
        #
        #     meshes.push mesh
        #
        #     this.write "meshes", meshes

    updateMesh: (mesh) ->

        # mesh = serializeMesh mesh
        # meshes = this.read "meshes"
        #
        # meshIndex = meshes.findIndex (localMesh) => localMesh.object.uuid is mesh.object.uuid
        #
        # if meshIndex >= 0
        #
        #     meshes[meshIndex] = mesh
        #
        #     this.write "meshes", meshes

    removeMesh: (mesh) ->

        # mesh = serializeMesh mesh
        # meshes = this.read "meshes"
        #
        # meshes.exclude (localMesh) => localMesh.object.uuid is mesh.object.uuid
        #
        # this.write "meshes", meshes
