# Link: https://threejs.org/docs/#api/en/materials/MeshNormalMaterial

class NormalMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "normal", params

class POLY.NormalMeshMaterial extends THREE.MeshNormalMaterial

    constructor : (params = {}) ->

        side = params.side ?= THREE.DoubleSide

        super

            side: side
