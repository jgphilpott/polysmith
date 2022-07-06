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

    spiralStart = spiral.getPoint 0
    spiralStop = spiral.getPoint 1

    spiralThickness = golden * 2
    spiralRadius = spiralStop.x / 4
    spiralRadiusSegments = golden * 10

    spiralPoints = []

    for point in [0...1.01] by golden / 100

        spiralPoints.push spiral.getPoint point

    extrudeSettings =

        steps: 180
        bevelEnabled: false
        extrudePath: new THREE.CatmullRomCurve3 spiralPoints

    shape = new THREE.Shape()

    shape.moveTo 0, - spiralRadius
    shape.quadraticCurveTo spiralRadius, - spiralRadius, spiralRadius, 0
    shape.quadraticCurveTo spiralRadius, spiralRadius, 0, spiralRadius
    shape.lineTo 0, spiralRadius - spiralThickness
    shape.quadraticCurveTo spiralRadius - spiralThickness, spiralRadius - spiralThickness, spiralRadius - spiralThickness, 0
    shape.quadraticCurveTo spiralRadius - spiralThickness, - spiralRadius + spiralThickness, 0, - spiralRadius + spiralThickness
    shape.lineTo 0, - spiralRadius

    spiralGeometry = new THREE.ExtrudeGeometry shape, extrudeSettings
    spiralMaterial = new THREE.MeshLambertMaterial color: 0xff8000
    spiralMesh = new THREE.Mesh spiralGeometry, spiralMaterial

    topCuter = newBox(spiralRadius * 4, spiralRadius * 4, spiralRadius * 4, [0, 0, spiralRadius * 2 + spiralThickness])

    spiralStartCapEx = newSphere spiralRadius * 2, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralRadius]
    spiralStopCapEx = newSphere spiralRadius, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x, spiralStop.y, spiralStop.z]

    spiralStartCapIn = newSphere spiralRadius * 2 - spiralThickness, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralRadius]
    spiralStopCapIn = newSphere spiralRadius - spiralThickness, spiralRadiusSegments * 2, spiralRadiusSegments * 2, [spiralStop.x, spiralStop.y, spiralStop.z]

    spiralStartCapEx.rotateX degree2radian 90
    spiralStopCapEx.rotateX degree2radian 90

    spiralStartCapIn.rotateX degree2radian 90
    spiralStopCapIn.rotateX degree2radian 90

    spiralStartCapEx = cut spiralStartCapEx, topCuter
    spiralStartCapIn = cut spiralStartCapIn, topCuter

    spiralStartCap = cut spiralStartCapEx, spiralStartCapIn
    spiralStopCap = cut spiralStopCapEx, spiralStopCapIn

    spiralMesh = cut spiralMesh, spiralStartCapIn

    spiralStartCap.name = "Start Cap"
    spiralStopCap.name = "Stop Cap"
    spiralStartCap.lock = "locked"
    spiralStopCap.lock = "locked"

    spiralMesh.name = "Spiral"
    spiralMesh.lock = "locked"

    addMesh spiralStartCap
    addMesh spiralStopCap

    addMesh spiralMesh
