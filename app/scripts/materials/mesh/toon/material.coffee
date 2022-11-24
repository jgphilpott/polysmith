# Link: https://threejs.org/docs/#api/en/materials/MeshToonMaterial

class ToonMeshMaterial extends MeshMaterial

    constructor : (params = {}) ->

        super "toon", params

class POLY.ToonMeshMaterial extends THREE.MeshToonMaterial

    constructor : (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
