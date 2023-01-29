# Link: https://threejs.org/docs/#api/en/materials/MeshDepthMaterial

class DepthMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "depth", params

class POLY.DepthMeshMaterial extends THREE.MeshDepthMaterial

    constructor: (params = {}) ->

        side = params.side ?= THREE.DoubleSide

        super

            side: side
