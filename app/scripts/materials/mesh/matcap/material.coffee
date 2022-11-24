# Link: https://threejs.org/docs/#api/en/materials/MeshMatcapMaterial

class MatcapMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "matcap", params

class POLY.MatcapMeshMaterial extends THREE.MeshMatcapMaterial

    constructor : (params) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super params
