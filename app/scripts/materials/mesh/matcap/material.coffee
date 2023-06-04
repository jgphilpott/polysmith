# Link: https://threejs.org/docs/#api/en/materials/MeshMatcapMaterial

class MatcapMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "matcap", params

class POLY.MatcapMeshMaterial extends THREE.MeshMatcapMaterial

    constructor: (params = {}) ->

        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
