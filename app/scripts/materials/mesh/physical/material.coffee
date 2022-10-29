# Link: https://threejs.org/docs/#api/en/materials/MeshPhysicalMaterial

class PhysicalMeshMaterial extends THREE.MeshPhysicalMaterial

    constructor : (color = blackThree, texture = null, side = THREE.DoubleSide) ->

        super color: color, map: texture, side: side
