polygen = (size = 5) ->

    wrench = newCylinder size, size * 2, size * 2, 6
    bolt = newCylinder size, size, size, 6

    handel = newBox size, size * 4, size, [0, size * 2, 0]
    handelCap = newCylinder size, size / 2, size / 2, 42, [0, size * 4, 0]

    wrench = cut wrench, bolt
    handel = cut handel, bolt

    bolt.position.y -= size

    wrench = join(join(cut(wrench, bolt), handel), handelCap)

    addMesh wrench
