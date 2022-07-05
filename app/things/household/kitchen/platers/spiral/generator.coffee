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

    spiralRadius = spiralStop.x / 4
    spiralRadiusSegments = golden * 10
    spiralSegments = golden * 100
    spiralThickness = golden * 2

    spiralPoints = []

    for point in [0.1...1.01] by golden / 100

        spiralPoints.push(spiral.getPoint(point))

    extrudeSettings =

        steps: golden * 100
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

    spiralStartCap = newSphere spiralRadius * 2, spiralRadiusSegments, spiralRadiusSegments / 2, [spiralStart.x, spiralStart.y, spiralStart.z + spiralRadius]
    spiralStopCap = newSphere spiralRadius, spiralRadiusSegments, spiralRadiusSegments / 2, [spiralStop.x, spiralStop.y, spiralStop.z]

    spiralStartCap.rotateX degree2radian 90
    spiralStopCap.rotateX degree2radian 90

    addMesh spiralStartCap
    addMesh spiralStopCap

    addMesh spiralMesh
