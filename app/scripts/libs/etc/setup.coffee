setup = () ->

    if polygen? then polygen() else localMeshes "load"

    composer.renderPass = new THREE.RenderPass scene, camera
    composer.shaderPass = new THREE.ShaderPass THREE.CopyShader
    composer.outlinePass = new THREE.OutlinePass new THREE.Vector2(window.innerWidth, window.innerHeight), scene, camera

    composer.outlinePass.hiddenEdgeColor.set whiteThree
    composer.outlinePass.visibleEdgeColor.set blackThree
    composer.outlinePass.overlayMaterial.blending = THREE.CustomBlending

    composer.addPass composer.renderPass
    composer.addPass composer.shaderPass
    composer.addPass composer.outlinePass

    animate = () ->

        requestAnimationFrame animate

        composer.render()

    animate()
