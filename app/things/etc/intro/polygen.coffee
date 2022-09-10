polygen = () ->

    geometry = new THREE.BoxGeometry 50, 50, 50
    material = new THREE.MeshStandardMaterial "color": blackThree
    cube = new THREE.Mesh geometry, material
    addMesh cube

    geometry = new THREE.SphereGeometry 25, 42, 42
    material = new THREE.MeshStandardMaterial "color": blackThree
    sphere = new THREE.Mesh geometry, material
    sphere.position.set 25, 25, 25
    addMesh sphere