polygen = (sides = 3, size = 75) ->

    thickness = 2
    lipSize = 10

    angle = null
    holderDistance = null
    slotDistance = null

    plate = newCylinder(thickness + lipSize, size + lipSize, size, sides, [0, 0, 0]).rotateX(deg$rad(90))
    lip = newCylinder(thickness + lipSize, size + lipSize - thickness, size - thickness, sides, [0, thickness, 0]).rotateX(deg$rad(90))

    switch sides

        when 3

            angle = 60
            holderDistance = 48
            slotDistance = 73
            data.title = "triangle"

            break

        when 4

            angle = 0
            holderDistance = 55
            slotDistance = 80
            data.title = "square"

            break

        when 5

            angle = 0
            holderDistance = - 58
            slotDistance = - 83
            data.title = "pentagon"

            break

        when 6

            angle = 0
            holderDistance = 58
            slotDistance = 83
            data.title = "hexagon"

            break

        when 7

            angle = 0
            holderDistance = - 60
            slotDistance = - 85
            data.title = "heptagon"

            break

        when 8

            angle = 0
            holderDistance = 60
            slotDistance = 85
            data.title = "octagon"

            break

        when 9

            angle = 0
            holderDistance = - 60
            slotDistance = - 85
            data.title = "nonagon"

            break

        when 10

            angle = 0
            holderDistance = 60
            slotDistance = 85
            data.title = "decagon"

            break

    glass_holder = newCylinder(lipSize * 2, lipSize, lipSize, 42, [side$angle(angle, holderDistance, null, true), 0, - side$angle(angle, holderDistance, true, null)]).rotateX(deg$rad(90))
    glass_slot = newBox(lipSize + 1, lipSize * 4, lipSize * 2, [0, slotDistance, 0]).rotateZ(deg$rad(- angle))

    cocktail_plate = cut(cut(cut(plate, lip), glass_holder), glass_slot)

    addMesh cocktail_plate