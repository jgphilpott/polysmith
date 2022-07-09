class ArchimedeanSpiral extends THREE.Curve

    constructor : (size = 1, length = degree2radian 360) ->

        super()

        @size = size
        @length = length

    getPoint : (point, coordinates = new THREE.Vector3()) ->

        angle = point * this.length

        x = angle * this.size * Math.cos angle
        y = angle * this.size * Math.sin angle

        return coordinates.set x, y, 0

polygen = () ->

    golden = 1.618033988749895

    spiral = new ArchimedeanSpiral 10, degree2radian 720
    spiralInvert= new ArchimedeanSpiral 10, degree2radian 900

    spiralStart = spiral.getPoint 0
    spiralStop = spiral.getPoint 1

    shapePathEx = []
    shapePathIn = []
    spiralPoints = []
    spiralInvertPoints = []
    spiralThickness = 3
    spiralSegments = 180
    spiralRadiusSegments = 18
    spiralRadius = spiralStop.x / 4

    for point in [0.21...1.01] by golden / 100

        spiralPoints.push spiral.getPoint point
        spiralInvertPoints.push spiralInvert.getPoint point

    spiralExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments
        extrudePath: new THREE.CatmullRomCurve3 spiralPoints

    spiralInvertExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments
        extrudePath: new THREE.CatmullRomCurve3 spiralInvertPoints

    for degree in [- 90 ... 91] by 90 / spiralRadiusSegments

        radius = spiralRadius + (spiralThickness / 2)

        x = radius * Math.cos degree2radian degree
        y = radius * Math.sin degree2radian degree

        shapePathEx.push new THREE.Vector2 x, y

    for degree in [90 ... - 91] by - 90 / spiralRadiusSegments

        radius = spiralRadius - (spiralThickness / 2)

        x = radius * Math.cos degree2radian degree
        y = radius * Math.sin degree2radian degree

        shapePathIn.push new THREE.Vector2 x, y

    shape = new THREE.Shape()

    shape.moveTo 0, - spiralRadius - (spiralThickness / 2)
    shape.setFromPoints shapePathEx
    shape.lineTo 0, spiralRadius - (spiralThickness / 2)
    shape.setFromPoints shapePathIn
    shape.lineTo 0, - spiralRadius - (spiralThickness / 2)

    shape2 = new THREE.Shape();

    shape2.moveTo spiralThickness / 2, 0
    shape2.absarc 0, 0, spiralThickness / 2, 0, 2 * Math.PI, false

    spiralGeometry = new THREE.ExtrudeGeometry shape, spiralExtrudeSettings
    spiralMaterial = new THREE.MeshLambertMaterial color: 0xff8000
    spiralMesh = new THREE.Mesh spiralGeometry, spiralMaterial

    sg = new THREE.ExtrudeGeometry shape2, spiralInvertExtrudeSettings
    sm = new THREE.MeshLambertMaterial color: 0xff0000
    smesh = new THREE.Mesh sg, sm

    smesh.rotateZ degree2radian 180
    scene.add smesh

    spiralStartTopCuter = newBox(spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, spiralRadius * 2.5 + spiralThickness])
    spiralStartBottomCuter = newBox(spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, - spiralRadius * 2.5 - spiralRadius - (spiralThickness / 2)])

    spiralStopTopCuter = newBox(spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [spiralStop.x, 0, spiralRadius * 2.5])
    spiralStopSideCuter = newBox(spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [spiralStop.x, - spiralRadius * 2.5 - golden, 0])

    spiralStartCapEx = newSphere spiralRadius * 2 + (spiralThickness / 2), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z]
    spiralStopCapEx = newSphere spiralRadius + (spiralThickness / 2), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x, spiralStop.y, spiralStop.z]

    spiralStartCapIn = newSphere spiralRadius * 2 + (spiralThickness / 2) - spiralThickness, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z]
    spiralStopCapIn = newSphere spiralRadius + (spiralThickness / 2) - spiralThickness, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x, spiralStop.y, spiralStop.z]

    spiralStartCapTrim = newTorus spiralRadius * 2, spiralThickness / 2, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [0, 0, spiralThickness]
    spiralStartCapTrim.rotateY degree2radian 90
    scene.add spiralStartCapTrim

    spiralStopCapTrim = newTorus(spiralRadius, spiralThickness / 2, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x, spiralStop.y, spiralStop.z])
    spiralStopCapTrim.scale.y = golden
    spiralStopCapTrim.rotateY degree2radian 90

    spiralStartCapEx.rotateX degree2radian 90
    spiralStopCapEx.rotateX degree2radian 90

    spiralStartCapIn.rotateX degree2radian 90
    spiralStopCapIn.rotateX degree2radian 90

    spiralStartCapEx.scale.y = golden
    spiralStartCapIn.scale.y = golden

    spiralStopCapEx.scale.z = golden
    spiralStopCapIn.scale.z = golden

    spiralStartCapEx = cut spiralStartCapEx, spiralStartTopCuter

    spiralStartCapEx = cut spiralStartCapEx, spiralStartBottomCuter
    spiralStartBottomCuter.position.z += spiralThickness
    spiralStartCapIn = cut spiralStartCapIn, spiralStartBottomCuter

    spiralStopCapEx = cut spiralStopCapEx, spiralStopTopCuter
    spiralStopCapEx = cut spiralStopCapEx, spiralStopSideCuter

    spiralStopCapTrim = cut spiralStopCapTrim, spiralStopSideCuter

    spiralStartCap = cut spiralStartCapEx, spiralStartCapIn
    spiralStopCap = cut spiralStopCapEx, spiralStopCapIn

    spiralStopSideCuter.position.x += spiralRadius * 1.5 + (spiralThickness / 2)
    spiralStopSideCuter.position.y += spiralRadius * 5

    # spiralMesh = cut spiralMesh, spiralStartCapEx
    spiralMesh = cut spiralMesh, spiralStopSideCuter

    spiralStartCap.name = "Start Cap"
    spiralStopCap.name = "Stop Cap"
    spiralStartCap.lock = "locked"
    spiralStopCap.lock = "locked"

    spiralMesh.name = "Spiral"
    spiralMesh.lock = "locked"

    addMesh spiralStartCap
    addMesh spiralStopCap
    addMesh spiralStopCapTrim
    addMesh spiralMesh
