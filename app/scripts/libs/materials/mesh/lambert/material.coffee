# Link: https://threejs.org/docs/#api/en/materials/MeshLambertMaterial

class LambertMeshMaterial extends THREE.MeshLambertMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
