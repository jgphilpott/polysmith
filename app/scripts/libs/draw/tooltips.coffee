class Tooltips

    constructor : (self = this) ->

        @selected = null

        @meshCount = 0
        @distanceLines = []
        @rotationTools = []

    setSelected : (selected = null) ->

        if this.selected

            this.removeRotationTools()

        this.selected = selected

        if selected

            this.addRotationTools()

        else

            this.removeRotationTools()

    getSelected : (self = this) ->

        return self.selected

    addRotationTools : (mesh = this.selected) ->

        geometry = new THREE.PlaneGeometry 10, 5

        xIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/red.png"
        yIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/green.png"
        zIcon = new THREE.TextureLoader().load "/app/imgs/icons/tooltips/rotate/blue.png"

        xMaterial = meshMaterial "basic", null, xIcon
        yMaterial = meshMaterial "basic", null, yIcon
        zMaterial = meshMaterial "basic", null, zIcon

        xTool = new THREE.Mesh geometry, xMaterial
        yTool = new THREE.Mesh geometry, yMaterial
        zTool = new THREE.Mesh geometry, zMaterial

        xTool.position.set mesh.position.x + 10, mesh.position.y, mesh.position.z
        yTool.position.set mesh.position.x, mesh.position.y + 10, mesh.position.z
        zTool.position.set mesh.position.x, mesh.position.y, mesh.position.z + 10

        this.rotationTools.push xTool, yTool, zTool
        scene.add xTool, yTool, zTool

        return this.rotationTools

    updateRotationTools : () ->

        return this.rotationTools

    removeRotationTools : () ->

        for rotationTool in this.rotationTools

            rotationTool.geometry.dispose()
            rotationTool.material.dispose()

            scene.remove rotationTool

        return this.rotationTools
