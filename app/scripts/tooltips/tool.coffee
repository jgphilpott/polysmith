class Tooltips

    constructor: (self = this) ->

        @selected = null
        @boundingBox = null

        @rotationTools = []
        @rotationRing = null

        @guidelines = new Guidelines()

    getSelected: (self = this) ->

        return self.selected

    setSelected: (selected = null) ->

        this.selected = selected

        this.boundingBox = null
        this.removeRotationTools()

        if selected

            if settings.get ["tooltips", "rotation"] then this.boundingBox = selected.geometry.boundingBox
            if settings.get ["tooltips", "bounding"] then this.addRotationTools()

    addRotationTools: (mesh = this.selected, tools = this.rotationTools) ->

        self = this

        geometry = new THREE.PlaneGeometry 6, 3

        xIcon = new THREE.TextureLoader().load "/app/imgs/icons/tools/rotate.png"
        yIcon = new THREE.TextureLoader().load "/app/imgs/icons/tools/rotate.png"
        zIcon = new THREE.TextureLoader().load "/app/imgs/icons/tools/rotate.png"

        xMaterial = new MeshMaterial "basic", color: false, map: xIcon
        yMaterial = new MeshMaterial "basic", color: false, map: yIcon
        zMaterial = new MeshMaterial "basic", color: false, map: zIcon

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

    updateRotationTools: (mesh = this.selected, tools = this.rotationTools) ->

        gapSize = 10

        xTool = tools[0]
        yTool = tools[1]
        zTool = tools[2]

        meshPosition = mesh.position
        cameraPosition = camera.getPosition()

        xPosition = if cameraPosition.x > meshPosition.x then meshPosition.x + this.boundingBox.max.x + gapSize else meshPosition.x + this.boundingBox.min.x - gapSize
        yPosition = if cameraPosition.y > meshPosition.y then meshPosition.y + this.boundingBox.max.y + gapSize else meshPosition.y + this.boundingBox.min.y - gapSize
        zPosition = if cameraPosition.z > meshPosition.z then meshPosition.z + this.boundingBox.max.z + gapSize else meshPosition.z + this.boundingBox.min.z - gapSize

        xRotation = if cameraPosition.x > meshPosition.x then deg$rad -90 else deg$rad 90
        yRotation = if cameraPosition.y > meshPosition.y then deg$rad 0 else deg$rad 180

        if cameraPosition.z > meshPosition.z

            zRotation = if cameraPosition.y > meshPosition.y then deg$rad 0 else deg$rad 180

        else

            zRotation = if cameraPosition.y > meshPosition.y then deg$rad 180 else deg$rad 0

        cameraBox = new Box length: 1, width: 1, height: 1, position: {x: cameraPosition.x, y: cameraPosition.y, z: zPosition}

        xTool.position.set xPosition, meshPosition.y, meshPosition.z
        yTool.position.set meshPosition.x, yPosition, meshPosition.z
        zTool.position.set meshPosition.x, meshPosition.y, zPosition

        cameraBox.up.set 0, 0, 1
        cameraBox.lookAt zTool.position
        zTool.quaternion.copy cameraBox.quaternion

        xTool.rotation.z = xRotation
        yTool.rotation.z = yRotation
        zTool.rotation.z = zRotation

    removeRotationTools: (mesh = this.selected, tools = this.rotationTools) ->

        for tool in tools

            events.removeEventListener tool, "mouseover"
            events.removeEventListener tool, "mouseout"

            tool.geometry.dispose()
            tool.material.dispose()

            scene.remove tool

        this.rotationTools = []

    addRotationRing: (axis, mesh = this.selected) ->

        gapSize = 10

        if not this.rotationRing

            geometry = new THREE.RingGeometry 5, 10, 10
            material = new MeshMaterial "basic", color: blackThree

            ring = new THREE.Mesh geometry, material

            cameraPosition = camera.getPosition()
            meshPosition = mesh.position

            switch axis

                when "x"

                    ring.rotation.y = deg$rad 90

                    ring.position.x = if cameraPosition.x > meshPosition.x then meshPosition.x + this.boundingBox.min.x - gapSize else meshPosition.x + this.boundingBox.max.x + gapSize
                    ring.position.y = meshPosition.y
                    ring.position.z = meshPosition.z

                when "y"

                    ring.rotation.x = deg$rad 90

                    ring.position.x = meshPosition.x
                    ring.position.y = if cameraPosition.y > meshPosition.y then meshPosition.y + this.boundingBox.min.y - gapSize else meshPosition.y + this.boundingBox.max.y + gapSize
                    ring.position.z = meshPosition.z

                when "z"

                    ring.position.x = meshPosition.x
                    ring.position.y = meshPosition.y
                    ring.position.z = if cameraPosition.z > meshPosition.z then meshPosition.z + this.boundingBox.min.z - gapSize else meshPosition.z + this.boundingBox.max.z + gapSize

            this.rotationRing = ring

            scene.add ring

    updateRotationRing: (ring = this.rotationRing) ->

        return ring

    removeRotationRing: (ring = this.rotationRing) ->

        this.rotationRing = null

        ring.geometry.dispose()
        ring.material.dispose()

        scene.remove ring
