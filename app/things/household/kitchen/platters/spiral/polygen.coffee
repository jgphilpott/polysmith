class ArchimedeanSpiral extends THREE.Curve

    constructor : (size = 1, length = deg$rad 360) ->

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

    settings.ui.title = "Spiral Platter"

    spiral = new ArchimedeanSpiral 10, deg$rad 720
    spiralTrim = new ArchimedeanSpiral 10, deg$rad 900

    spiralStart = spiral.getPoint 0
    spiralStop = spiral.getPoint 1

    spiralPathEx = []
    spiralPathIn = []
    spiralPoints = []
    spiralTrimPoints = []

    spiralStartPoint = 0.25
    spiralStopPoint = 1.003
    spiralStartCapOffset = 0
    spiralStopCapOffset = 0.065

    spiralThickness = 3
    spiralSegments = 180
    spiralRadiusSegments = 18
    spiralRadius = spiralStop.x / 4

    for point in [spiralStartPoint ... spiralStopPoint] by golden / 200

        spiralPoints.push spiral.getPoint point
        spiralTrimPoints.push spiralTrim.getPoint point

    spiralExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments
        extrudePath: new THREE.CatmullRomCurve3 spiralPoints

    spiralTrimExtrudeSettings =

        bevelEnabled: false
        steps: spiralSegments * 2
        extrudePath: new THREE.CatmullRomCurve3 spiralTrimPoints

    for degree in [- 90 ... 91] by 90 / spiralRadiusSegments

        radius = spiralRadius + spiralThickness / 3

        x = radius * Math.cos deg$rad degree
        y = radius * Math.sin deg$rad degree

        spiralPathEx.push new THREE.Vector2 x, y

    for degree in [90 ... - 91] by - 90 / spiralRadiusSegments

        radius = spiralRadius - spiralThickness / 2

        x = radius * Math.cos deg$rad degree
        y = radius * Math.sin deg$rad degree

        spiralPathIn.push new THREE.Vector2 x, y

    spiralPath = new THREE.Shape()
    spiralTrimPath = new THREE.Shape()

    spiralPath.moveTo 0, - spiralRadius - (spiralThickness / 3)
    spiralPath.setFromPoints spiralPathEx
    spiralPath.lineTo 0, spiralRadius - (spiralThickness / 2)
    spiralPath.setFromPoints spiralPathIn
    spiralPath.lineTo 0, - spiralRadius - (spiralThickness / 3)

    spiralTrimPath.moveTo spiralThickness / golden, 0
    spiralTrimPath.absarc 0, 0, spiralThickness / golden, 0, Math.PI * 2, false

    spiralGeometry = new THREE.ExtrudeGeometry spiralPath, spiralExtrudeSettings
    spiralMaterial = new THREE.MeshLambertMaterial color: 0xff8000
    spiralMesh = new THREE.Mesh spiralGeometry, spiralMaterial

    spiralTrimGeometry = new THREE.ExtrudeGeometry spiralTrimPath, spiralTrimExtrudeSettings
    spiralTrimMaterial = new THREE.MeshLambertMaterial color: 0xff0000
    spiralTrimMesh = new THREE.Mesh spiralTrimGeometry, spiralTrimMaterial
    spiralTrimMesh.rotateZ deg$rad 180

    spiralStartCapEx = newSphere spiralRadius * 2 + (spiralThickness / 3), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralStartCapOffset]
    spiralStartCapIn = newSphere spiralRadius * 2 - (spiralThickness / 2), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralStartCapOffset]

    spiralStopCapEx = newSphere spiralRadius + (spiralThickness / 3), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - spiralStopCapOffset, spiralStop.y, spiralStop.z]
    spiralStopCapIn = newSphere spiralRadius - (spiralThickness / 2), spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - spiralStopCapOffset, spiralStop.y, spiralStop.z]

    spiralStartCapTrim = newTorus spiralRadius * 2, spiralThickness / golden, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralStartCapOffset]
    spiralStartCapTrim.rotateY deg$rad 90

    spiralStopCapTrim = newTorus spiralRadius, spiralThickness / golden, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x - (spiralStopCapOffset * 3), spiralStop.y, spiralStop.z]
    spiralStopCapTrim.rotateY deg$rad 90
    spiralStopCapTrim.scale.y = golden

    spiralStartTopCutter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, spiralRadius * 2.5]
    spiralStartBottomCutter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [0, 0, - spiralRadius * 2.5 - spiralRadius - (spiralThickness / 3)]

    spiralStopTopCutter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 5, [spiralStop.x, 0, spiralRadius * 2.5]
    spiralStopSideCutter = newBox spiralRadius * 5, spiralRadius * 5, spiralRadius * 2 + spiralThickness, [spiralStop.x, - spiralRadius * 2.5, 0]

    spiralStartTrimCutter = newCylinder spiralRadius, spiralRadius * 2, spiralRadius * 2
    spiralStopTrimCutter = newCylinder spiralRadius, spiralStop.x - spiralRadius + (spiralThickness / 2), spiralStop.x - spiralRadius + (spiralThickness / 2)

    spiralStartCapEx.rotateX deg$rad 90
    spiralStartCapIn.rotateX deg$rad 90

    spiralStopCapEx.rotateX deg$rad 90
    spiralStopCapIn.rotateX deg$rad 90

    spiralStartCapEx.scale.y = golden
    spiralStartCapIn.scale.y = golden

    spiralStopCapEx.scale.z = golden
    spiralStopCapIn.scale.z = golden

    spiralMesh = cut spiralMesh, spiralStartCapIn
    spiralTrimMesh = cut spiralTrimMesh, spiralStartCapEx

    spiralStartCapEx = cut spiralStartCapEx, spiralStartTopCutter
    spiralStartCapEx = cut spiralStartCapEx, spiralStartBottomCutter
    spiralStartBottomCutter.position.z += spiralThickness + golden
    spiralStartCapIn = cut spiralStartCapIn, spiralStartBottomCutter

    spiralStopCapEx = cut spiralStopCapEx, spiralStopTopCutter
    spiralStopCapEx = cut spiralStopCapEx, spiralStopSideCutter

    spiralStopCapTrim = cut spiralStopCapTrim, spiralStopSideCutter
    spiralStopCapTrim = cut spiralStopCapTrim, spiralStopTrimCutter

    spiralStartCap = cut spiralStartCapEx, spiralStartCapIn
    spiralStopCap = cut spiralStopCapEx, spiralStopCapIn

    spiralStopSideCutter.position.x += spiralRadius * 2.5 - spiralRadius + (spiralThickness / 2)
    spiralStopSideCutter.position.y += spiralRadius * 5

    spiralMesh = cut spiralMesh, spiralStopSideCutter
    spiralStopSideCutter.position.x += spiralThickness
    spiralTrimMesh = cut spiralTrimMesh, spiralStopSideCutter

    spiralStopCap.position.y -= spiralStopCapOffset
    spiralStopCapTrim.position.y -= spiralStopCapOffset

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
