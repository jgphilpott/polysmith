# Link: https://threejs.org/docs/#api/en/materials/MeshBasicMaterial

class BasicMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "basic", params

class POLY.BasicMeshMaterial extends THREE.MeshBasicMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
