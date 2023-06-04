# Link: https://threejs.org/docs/#api/en/materials/MeshStandardMaterial

class StandardMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "standard", params

class POLY.StandardMeshMaterial extends THREE.MeshStandardMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
