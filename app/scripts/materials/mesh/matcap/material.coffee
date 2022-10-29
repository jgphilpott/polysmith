# Link: https://threejs.org/docs/#api/en/materials/MeshMatcapMaterial

class MatcapMeshMaterial extends THREE.MeshMatcapMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
