# Link: https://threejs.org/docs/#api/en/materials/MeshBasicMaterial

class BasicMeshMaterial extends THREE.MeshBasicMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
