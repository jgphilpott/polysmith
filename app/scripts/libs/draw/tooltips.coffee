class Tooltips

    constructor : (self = this) ->

        @selected = null
        @boundingBox = null

        @meshCount = 0
        @distanceLines = []
        @rotationTools = []
        @rotationRing = null

    setSelected : (selected = null) ->

        this.selected = selected

        this.boundingBox = null
        this.removeRotationTools()

        if selected

            this.boundingBox = getBoundingBox selected
            this.addRotationTools()

    getSelected : (self = this) ->

        return self.selected

    addRotationTools : (mesh = this.selected, tools = this.rotationTools) ->

        self = this

        geometry = new THREE.PlaneGeometry 6, 3

        xIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/red.png"
        yIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/green.png"
        zIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/blue.png"

        xMaterial = new MeshMaterial "basic", null, xIcon
        yMaterial = new MeshMaterial "basic", null, yIcon
        zMaterial = new MeshMaterial "basic", null, zIcon

        xTool = new THREE.Mesh geometry, xMaterial
        yTool = new THREE.Mesh geometry, yMaterial
        zTool = new THREE.Mesh geometry, zMaterial

        events.addEventListener xTool, "mouseover", (event) ->
            $("#canvas").css "cursor", "pointer"
            self.addRotationRing("x")

        events.addEventListener xTool, "mouseout", (event) ->
            $("#canvas").css "cursor", ""
            self.removeRotationRing()

        events.addEventListener yTool, "mouseover", (event) ->
            $("#canvas").css "cursor", "pointer"
            self.addRotationRing("y")

        events.addEventListener yTool, "mouseout", (event) ->
            $("#canvas").css "cursor", ""
            self.removeRotationRing()

        events.addEventListener zTool, "mouseover", (event) ->
            $("#canvas").css "cursor", "pointer"
            self.addRotationRing("z")

        events.addEventListener zTool, "mouseout", (event) ->
            $("#canvas").css "cursor", ""
            self.removeRotationRing()

        tools.push xTool, yTool, zTool
        scene.add xTool, yTool, zTool

        this.updateRotationTools()

    updateRotationTools : (mesh = this.selected, tools = this.rotationTools) ->

        gapSize = 10

        xTool = tools[0]
        yTool = tools[1]
        zTool = tools[2]

        xPosition = if camera.position.x > mesh.position.x then mesh.position.x + this.boundingBox.max.x + gapSize else mesh.position.x + this.boundingBox.min.x - gapSize
        yPosition = if camera.position.y > mesh.position.y then mesh.position.y + this.boundingBox.max.y + gapSize else mesh.position.y + this.boundingBox.min.y - gapSize
        zPosition = if camera.position.z > mesh.position.z then mesh.position.z + this.boundingBox.max.z + gapSize else mesh.position.z + this.boundingBox.min.z - gapSize

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

            events.removeEventListener tool, "mouseover"
            events.removeEventListener tool, "mouseout"

            tool.geometry.dispose()
            tool.material.dispose()

            scene.remove tool

        this.rotationTools = []

    addRotationRing : (axis, mesh = this.selected) ->

        gapSize = 10

        if not this.rotationRing

            geometry = new THREE.RingGeometry 5, 10, 10
            material = new MeshMaterial "basic", blackThree

            ring = new THREE.Mesh geometry, material

            switch axis

                when "x"

                    ring.rotation.y = deg$rad 90

                    ring.position.x = if camera.position.x > mesh.position.x then mesh.position.x + this.boundingBox.min.x - gapSize else mesh.position.x + this.boundingBox.max.x + gapSize
                    ring.position.y = mesh.position.y
                    ring.position.z = mesh.position.z

                when "y"

                    ring.rotation.x = deg$rad 90

                    ring.position.x = mesh.position.x
                    ring.position.y = if camera.position.y > mesh.position.y then mesh.position.y + this.boundingBox.min.y - gapSize else mesh.position.y + this.boundingBox.max.y + gapSize
                    ring.position.z = mesh.position.z

                when "z"

                    ring.position.x = mesh.position.x
                    ring.position.y = mesh.position.y
                    ring.position.z = if camera.position.z > mesh.position.z then mesh.position.z + this.boundingBox.min.z - gapSize else mesh.position.z + this.boundingBox.max.z + gapSize

            this.rotationRing = ring

            scene.add ring

    updateRotationRing : (ring = this.rotationRing) ->

        return ring

    removeRotationRing : (ring = this.rotationRing) ->

        this.rotationRing = null

        ring.geometry.dispose()
        ring.material.dispose()

        scene.remove ring
