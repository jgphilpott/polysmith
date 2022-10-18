# Link: https://threejs.org/docs/#api/en/materials/MeshToonMaterial

class ToonMeshMaterial extends THREE.MeshToonMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
