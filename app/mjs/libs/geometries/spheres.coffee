# Link: https://threejs.org/docs/#api/en/geometries/SphereGeometry

newSphere = (radius=5, widthSegments=42, heightSegments=42, position=[0, 0, 0], material="normal", color=blackThree) ->

  geometry = new THREE.SphereGeometry radius, widthSegments, heightSegments
  sphere = new THREE.Mesh geometry, meshMaterial material, color

  sphere.position.set position[0], position[1], position[2]

  sphere.class = "sphere"
  sphere.name = "Sphere"

  return sphere

addSphere = (radius=5, widthSegments=42, heightSegments=42, position=[0, 0, 0], material="normal", color=blackThree) ->

  return window.addMesh newSphere radius, widthSegments, heightSegments, position, material, color
