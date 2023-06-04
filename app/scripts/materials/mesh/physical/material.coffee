# Link: https://threejs.org/docs/#api/en/materials/MeshPhysicalMaterial

class PhysicalMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "physical", params

class POLY.PhysicalMeshMaterial extends THREE.MeshPhysicalMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
