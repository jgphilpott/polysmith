# Link: https://threejs.org/docs/#api/en/materials/MeshStandardMaterial

class StandardMeshMaterial extends THREE.MeshStandardMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
