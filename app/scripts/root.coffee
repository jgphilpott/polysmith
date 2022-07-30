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

    golden = 1.618

    spiral = new ArchimedeanSpiral 10, degree2radian 720
    spiralInvert= new ArchimedeanSpiral 10, degree2radian 900

    spiralStart = spiral.getPoint 0
    spiralStop = spiral.getPoint 1

    spiralPathEx = []
    spiralPathIn = []
    spiralPoints = []
    spiralInvertPoints = []

    spiralStartPoint = 0.21
    spiralStopPoint = 1.005
    spiralStartCapOffset = 0
    spiralStopCapOffset = 0.1

    spiralThickness = 3
    spiralSegments = 180
    spiralRadiusSegments = 18
    spiralRadius = spiralStop.x / 4

    for point in [spiralStartPoint ... spiralStopPoint] by golden / 200

        spiralPoints.push spiral.getPoint point
        spiralInvertPoints.push spiralInvert.getPoint point

    spiralExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments
        extrudePath: new THREE.CatmullRomCurve3 spiralPoints

    spiralInvertExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments * 2
        extrudePath: new THREE.CatmullRomCurve3 spiralInvertPoints

    for degree in [- 90 ... 91] by 90 / spiralRadiusSegments

        radius = spiralRadius + spiralThickness / 3

        x = radius * Math.cos degree2radian degree
        y = radius * Math.sin degree2radian degree

        spiralPathEx.push new THREE.Vector2 x, y

    for degree in [90 ... - 91] by - 90 / spiralRadiusSegments

        radius = spiralRadius - spiralThickness / 2

        x = radius * Math.cos degree2radian degree
        y = radius * Math.sin degree2radian degree

        spiralPathIn.push new THREE.Vector2 x, y

    spiralPath = new THREE.Shape()
    spiralTrimPath = new THREE.Shape()

    spiralPath.moveTo 0, - spiralRadius - (spiralThickness / 3)
    spiralPath.setFromPoints spiralPathEx
    spiralPath.lineTo 0, spiralRadius - (spiralThickness / 2)
    spiralPath.setFromPoints spiralPathIn
    spiralPath.lineTo 0, - spiralRadius - (spiralThickness / 3)

    spiralTrimPath.moveTo spiralThickness / golden, 0
    spiralTrimPath.absarc 0, 0, spiralThickness / golden, 0, 2 * Math.PI, false

    spiralGeometry = new THREE.ExtrudeGeometry spiralPath, spiralExtrudeSettings
    spiralMaterial = new THREE.MeshLambertMaterial color: 0xff8000
    spiralMesh = new THREE.Mesh spiralGeometry, spiralMaterial

    spiralTrimGeometry = new THREE.ExtrudeGeometry spiralTrimPath, spiralInvertExtrudeSettings
    spiralTrimMaterial = new THREE.MeshLambertMaterial color: 0xff0000
    spiralTrimMesh = new THREE.Mesh spiralTrimGeometry, spiralTrimMaterial
    spiralTrimMesh.rotateZ degree2radian 180

    spiralStartCapEx = newSphere spiralRadius * 2 + (spiralThickness / 3), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z]
    spiralStopCapEx = newSphere spiralRadius + (spiralThickness / 2.7), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - spiralStopCapOffset, spiralStop.y, spiralStop.z]

    spiralStartCapIn = newSphere spiralRadius * 2 - (spiralThickness / 2), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z]
    spiralStopCapIn = newSphere spiralRadius - (spiralThickness / 2.15), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - spiralStopCapOffset, spiralStop.y, spiralStop.z]

    spiralStartCapTrim = newTorus spiralRadius * 2, spiralThickness / golden, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [0, 0, 0]
    spiralStartCapTrim.rotateY degree2radian 90

    spiralStopCapTrim = newTorus(spiralRadius, spiralThickness / golden, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - spiralStopCapOffset, spiralStop.y, spiralStop.z])
    spiralStopCapTrim.rotateY degree2radian 90
    spiralStopCapTrim.scale.y = golden

    spiralStartTopCuter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, spiralRadius * 2.5]
    spiralStartBottomCuter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, - spiralRadius * 2.5 - spiralRadius - (spiralThickness / 3)]

    spiralStopTopCuter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [spiralStop.x, 0, spiralRadius * 2.5]
    spiralStopSideCuter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [spiralStop.x, - spiralRadius * 2.5, 0]

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

    spiralStartCap = cut spiralStartCapEx, spiralStartCapIn
    spiralStopCap = cut spiralStopCapEx, spiralStopCapIn

    spiralStopCapTrim = cut spiralStopCapTrim, spiralStopSideCuter

    spiralStopSideCuter.position.x += spiralRadius * 2.5 - spiralRadius + (spiralThickness / 2.15)
    spiralStopSideCuter.position.y += spiralRadius * 5

    spiralMesh = cut spiralMesh, spiralStartCapEx
    spiralMesh = cut spiralMesh, spiralStopSideCuter
    spiralTrimMesh = cut spiralTrimMesh, newSphere spiralRadius * 2, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z]
    spiralTrimMesh = cut spiralTrimMesh, spiralStopSideCuter

    spiralMesh.name = "Spiral"; spiralMesh.lock = "locked"
    spiralTrimMesh.name = "Spiral Trim"; spiralTrimMesh.lock = "locked"

    spiralStartCap.name = "Start Cap"; spiralStartCap.lock = "locked"
    spiralStartCapTrim.name = "Start Trim"; spiralStartCapTrim.lock = "locked"

    spiralStopCap.name = "Stop Cap"; spiralStopCap.lock = "locked"
    spiralStopCapTrim.name = "Stop Trim"; spiralStopCapTrim.lock = "locked"

    addMesh spiralMesh
    addMesh spiralTrimMesh

    addMesh spiralStartCap
    addMesh spiralStartCapTrim

    addMesh spiralStopCap
    addMesh spiralStopCapTrim
