# Link: https://threejs.org/docs/#api/en/geometries/ConeGeometry

newCone = (radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) ->

  geometry = new THREE.ConeGeometry radius, height, radialSegments
  cone = new THREE.Mesh geometry, meshMaterial material, color

  cone.position.set position[0], position[1], position[2]
  cone.rotation.x = degree2radian 90

  cone.class = "cone"
  cone.name = "Cone"

  return cone

addCone = (radius=5, height=10, radialSegments=42, position=[0, 0, 0], material="normal", color=blackThree) ->

  return window.addMesh newCone radius, height, radialSegments, position, material, color
