class Tooltips

    constructor : (self = this) ->

        @selected = null

        @meshCount = 0
        @distanceLines = []
        @rotationTools = []

    setSelected : (selected = null) ->

        this.selected = selected
        this.removeRotationTools()
        if this.selected then this.addRotationTools()

    getSelected : (self = this) ->

        return self.selected

    addRotationTools : (mesh = this.selected, tools = this.rotationTools) ->

        geometry = new THREE.PlaneGeometry 6, 3

        xIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/red.png"
        yIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/green.png"
        zIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/blue.png"

        xMaterial = meshMaterial "basic", null, xIcon
        yMaterial = meshMaterial "basic", null, yIcon
        zMaterial = meshMaterial "basic", null, zIcon

        xTool = new THREE.Mesh geometry, xMaterial
        yTool = new THREE.Mesh geometry, yMaterial
        zTool = new THREE.Mesh geometry, zMaterial

        tools.push xTool, yTool, zTool
        scene.add xTool, yTool, zTool

        this.updateRotationTools()

    updateRotationTools : (mesh = this.selected, tools = this.rotationTools) ->

        gapSize = 10

        xTool = tools[0]
        yTool = tools[1]
        zTool = tools[2]

        boundingBox = getBoundingBox mesh

        xPosition = if camera.position.x > mesh.position.x then mesh.position.x + boundingBox.max.x + gapSize else mesh.position.x + boundingBox.min.x - gapSize
        yPosition = if camera.position.y > mesh.position.y then mesh.position.y + boundingBox.max.y + gapSize else mesh.position.y + boundingBox.min.y - gapSize
        zPosition = if camera.position.z > mesh.position.z then mesh.position.z + boundingBox.max.z + gapSize else mesh.position.z + boundingBox.min.z - gapSize

        xRotation = if camera.position.x > mesh.position.x then deg$rad -90 else deg$rad 90
        yRotation = if camera.position.y > mesh.position.y then deg$rad 0 else deg$rad 180

        if camera.position.z > mesh.position.z

            zRotation = if camera.position.y > mesh.position.y then deg$rad 0 else deg$rad 180

        else

            zRotation = if camera.position.y > mesh.position.y then deg$rad 180 else deg$rad 0

        cameraBox = newBox 1, 1, 1, [camera.position.x, camera.position.y, zPosition]

        xTool.position.set xPosition, mesh.position.y, mesh.position.z
        yTool.position.set mesh.position.x, yPosition, mesh.position.z
        zTool.position.set mesh.position.x, mesh.position.y, zPosition

        cameraBox.up.set 0, 0, 1
        cameraBox.lookAt zTool.position
        zTool.quaternion.copy cameraBox.quaternion

        xTool.rotation.z = xRotation
        yTool.rotation.z = yRotation
        zTool.rotation.z = zRotation

    removeRotationTools : (mesh = this.selected, tools = this.rotationTools) ->

        for tool in tools

            tool.geometry.dispose()
            tool.material.dispose()

            scene.remove tool

        this.rotationTools = []
