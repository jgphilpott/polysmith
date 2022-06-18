# Link: https://threejs.org/docs/#api/en/geometries/TubeGeometry

newPath = (vertices=[[]]) ->

  path = []

  for vertex in vertices

    path.push new THREE.Vector3 vertex[0], vertex[1], vertex[2]

  return new THREE.CatmullRomCurve3 path

newTube = (vertices=[[10, 10, 10], [-10, -10, -10]], radius=1, radialSegments=42, tubularSegments=1, closed=false, material="normal", color=blackThree) ->

  geometry = new THREE.TubeGeometry newPath(vertices), tubularSegments, radius, radialSegments, closed
  tube = new THREE.Mesh geometry, meshMaterial material, color

  tube.class = "tube"
  tube.name = "Tube"

  return tube

addTube = (vertices=[[10, 10, 10], [-10, -10, -10]], radius=1, radialSegments=42, tubularSegments=1, closed=false, material="normal", color=blackThree) ->

  return window.addMesh newTube vertices, radius, radialSegments, tubularSegments, closed, material, color
