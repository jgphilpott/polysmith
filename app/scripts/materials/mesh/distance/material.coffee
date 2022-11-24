# Link: https://threejs.org/docs/#api/en/materials/MeshDistanceMaterial

class DistanceMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "distance", params

class POLY.DistanceMeshMaterial extends THREE.MeshDistanceMaterial

    constructor : (params) ->

        side = params.side ?= THREE.DoubleSide

        super params
