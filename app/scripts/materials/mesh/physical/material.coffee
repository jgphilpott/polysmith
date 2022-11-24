# Link: https://threejs.org/docs/#api/en/materials/MeshPhysicalMaterial

class PhysicalMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "physical", params

class POLY.PhysicalMeshMaterial extends THREE.MeshPhysicalMaterial

    constructor : (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
