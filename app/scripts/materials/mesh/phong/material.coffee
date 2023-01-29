# Link: https://threejs.org/docs/#api/en/materials/MeshPhongMaterial

class PhongMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "phong", params

class POLY.PhongMeshMaterial extends THREE.MeshPhongMaterial

    constructor: (params = {}) ->

        map = params.map ?= null
        color = params.color ?= blackThree
        side = params.side ?= THREE.DoubleSide

        super

            map: map
            color: color
            side: side
