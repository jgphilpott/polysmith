# Link: https://threejs.org/docs/#api/en/materials/MeshDepthMaterial

class DepthMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "depth", params

class POLY.DepthMeshMaterial extends THREE.MeshDepthMaterial

    constructor: (params = {}) ->

        params.reflectivity = if params.reflectivity then params.reflectivity / 100 else 0.5
        params.transmission = if params.transmission then params.transmission / 100 else 0
        params.metalness = if params.metalness then params.metalness / 100 else 0.5
        params.roughness = if params.roughness then params.roughness / 100 else 0.5
        params.opacity = if params.opacity then params.opacity / 100 else 1
        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
