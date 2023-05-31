class TooltipsSettings

    constructor: (settings) ->

        if _.isObject settings

            for setting in Object.keys settings

                @[setting] = settings[setting]

    defaults: ->

        bounding: true
        rotation: true
        guidelines: true
        measurements: false
        grid:

            volume: false
            caps: true
            axes:

                x: true
                y: true
                z: true

            ticks:

                xy: true
                xz: false
                yz: false

                step:

                    xy: 10
                    xz: 10
                    yz: 10

    update: (path, value) ->

        switch path[1]

            when "guidelines"

                $(".settings-category #tooltips-measurements").prop "disabled", not value

            when "grid"

                $(".settings-category #" + path.join("-") + "").prop "checked", value

                switch path[2]

                    when "axes"

                        switch path[3]

                            when "x"

                                if value

                                    grid.axes.addX printer.getSizeX(), false

                                else

                                    grid.axes.removeX false

                            when "y"

                                if value

                                    grid.axes.addY printer.getSizeY(), false

                                else

                                    grid.axes.removeY false

                            when "z"

                                if value

                                    grid.axes.addZ printer.getSizeZ(), false

                                else

                                    grid.axes.removeZ false

                    when "caps"

                        if value

                            grid.caps.addCentroid false

                            grid.caps.addX printer.getSizeX(), false
                            grid.caps.addY printer.getSizeY(), false
                            grid.caps.addZ printer.getSizeZ(), false

                        else

                            grid.caps.removeCentroid false

                            grid.caps.removeX false
                            grid.caps.removeY false
                            grid.caps.removeZ false

                    when "ticks"

                        if path[3] is "step"

                            value = adaptor "convert", "length", value

                            switch path[4]

                                when "xy"

                                    grid.ticks.setStepXY value, false

                                when "xz"

                                    grid.ticks.setStepXZ value, false

                                when "yz"

                                    grid.ticks.setStepYZ value, false

                        else

                            switch path[3]

                                when "xy"

                                    if value

                                        grid.ticks.addXY printer.getSizeX(), printer.getSizeY(), false

                                    else

                                        grid.ticks.removeXY false

                                when "xz"

                                    if value

                                        grid.ticks.addXZ printer.getSizeX(), printer.getSizeZ(), false

                                    else

                                        grid.ticks.removeXZ false

                                when "yz"

                                    if value

                                        grid.ticks.addYZ printer.getSizeY(), printer.getSizeZ(), false

                                    else

                                        grid.ticks.removeYZ false
