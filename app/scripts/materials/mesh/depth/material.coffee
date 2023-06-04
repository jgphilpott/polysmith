# Link: https://threejs.org/docs/#api/en/materials/MeshDepthMaterial

class DepthMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "depth", params

class POLY.DepthMeshMaterial extends THREE.MeshDepthMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
