polygen = (dimensions = 3) ->

    size = 10
    cutoutSize = 5
    totalSize = size
    sizeMultiplier = 2.5

    for _ in [0...dimensions - 1]

        totalSize *= sizeMultiplier

    for _ in [0...dimensions]

        boxGeometry = new THREE.BoxGeometry size, size, size
        box = new THREE.Mesh boxGeometry, meshMaterial()

        boxStandGeometry = new THREE.BoxGeometry size, size, totalSize / 2
        boxStand = new THREE.Mesh boxStandGeometry, meshMaterial()
        boxStand.position.set 0, 0, - totalSize / 4
        box = join box, boxStand

        cutOneGeometry = new THREE.BoxGeometry totalSize + 1, cutoutSize, cutoutSize
        cutTwoGeometry = new THREE.BoxGeometry cutoutSize, totalSize + 1, cutoutSize
        cutThreeGeometry = new THREE.BoxGeometry cutoutSize, cutoutSize, totalSize + 1

        cutOne = new THREE.Mesh cutOneGeometry, meshMaterial()
        cutTwo = new THREE.Mesh cutTwoGeometry, meshMaterial()
        cutThree = new THREE.Mesh cutThreeGeometry, meshMaterial()

        cutOne.rotateX Math.PI / 4
        cutTwo.rotateY Math.PI / 4
        cutThree.rotateZ Math.PI / 4

        cutoutSize *= sizeMultiplier
        size *= sizeMultiplier

        box = cut box, cutOne
        box = cut box, cutTwo
        box = cut box, cutThree

        addMesh box