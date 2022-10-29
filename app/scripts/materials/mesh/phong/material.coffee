# Link: https://threejs.org/docs/#api/en/materials/MeshPhongMaterial

class PhongMeshMaterial extends THREE.MeshPhongMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
