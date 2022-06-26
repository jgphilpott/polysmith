class ArchimedeanSpiral extends THREE.Curve

    constructor : (size = 10, length = 10) ->

        super()

        @size = size
        @length = length

    getPoint : (t, optionalTarget = new THREE.Vector3()) ->

        angle = t * this.length

        tx = angle * this.size * Math.cos angle
        ty = angle * this.size * Math.sin angle

        return optionalTarget.set tx, ty, 0

polygen = () ->

  spiral = new ArchimedeanSpiral()

  geometry = new THREE.TubeGeometry spiral, 100, 2, 8, false
  material = new THREE.MeshBasicMaterial color: 0x00ff00
  mesh = new THREE.Mesh geometry, material
  scene.add mesh

  geometry2 = new THREE.TubeGeometry spiral, 100, 2, 8, false
  material2 = new THREE.MeshBasicMaterial color: 0x0000ff
  mesh2 = new THREE.Mesh geometry2, material2
  mesh2.rotateZ degree2radian 180
  scene.add mesh2
