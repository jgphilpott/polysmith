class Image extends Mesh

    constructor : (params = {}) ->

        super "image", params

class POLY.ImageMesh

    constructor : (params = {}) ->

        params.material ?= "normal"
        params.mesh ?= new THREE.Mesh()

        params.mesh.geometry = new ImageGeometry params
        params.mesh.material = new MeshMaterial params.material, params

        params.mesh.class = "image"
        params.mesh.name = "Image"

        return params.mesh
