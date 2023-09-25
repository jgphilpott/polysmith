class SettingsPanel

    constructor: ->

        return this

    add: ->

        scale = settings.get "scales.scale"

        lengthMetric = settings.get "scales.length.unit.metric"
        lengthImperial = settings.get "scales.length.unit.imperial"

        areaMetric = settings.get "scales.area.unit.metric"
        areaImperial = settings.get "scales.area.unit.imperial"

        volumeMetric = settings.get "scales.volume.unit.metric"
        volumeImperial = settings.get "scales.volume.unit.imperial"

        settingsPanel =

            """
            <div id='settings' class='panel'>

                <img title='Close' class='close' src='/app/imgs/panels/nav/close/black.png'>
                <img title='Reset Settings' class='reset' src='/app/imgs/panels/tools/reset.png'>

                <h3>Advanced Settings</h3>

                <div id='first' class='settings-column'></div>
                <div id='second' class='settings-column'></div>
                <div id='third' class='settings-column'></div>

            </div>
            """

        measurementSettings =

            """
            <div id='measurement-settings' class='settings-category'>

                <h4>Measurement</h4>

                <div>

                    <label>Scale:</label>

                    <select id='scales-scale'>

                        <option value='metric' """ + (if scale is "metric" then "selected" else "") + """>Metric</option>
                        <option value='imperial' """ + (if scale is "imperial" then "selected" else "") + """>Imperial</option>

                    </select>

                </div>

                <div>

                    <label>Length:</label>

                    <select id='scales-length' class='metric'>

                        <option value='nanometer' """ + (if lengthMetric is "nanometer" then "selected" else "") + """>Nanometer</option>
                        <option value='micrometer' """ + (if lengthMetric is "micrometer" then "selected" else "") + """>Micrometer</option>
                        <option value='millimeter' """ + (if lengthMetric is "millimeter" then "selected" else "") + """>Millimeter</option>
                        <option value='centimeter' """ + (if lengthMetric is "centimeter" then "selected" else "") + """>Centimeter</option>
                        <option value='decimeter' """ + (if lengthMetric is "decimeter" then "selected" else "") + """>Decimeter</option>
                        <option value='meter' """ + (if lengthMetric is "meter" then "selected" else "") + """>Meter</option>

                    </select>

                    <select id='scales-length' class='imperial'>

                        <option value='inch' """ + (if lengthImperial is "inch" then "selected" else "") + """>Inch</option>
                        <option value='foot' """ + (if lengthImperial is "foot" then "selected" else "") + """>Foot</option>
                        <option value='yard' """ + (if lengthImperial is "yard" then "selected" else "") + """>Yard</option>

                    </select>

                </div>

                <div>

                    <label>Area:</label>

                    <select id='scales-area' class='metric'>

                        <option value='nanometerSq' """ + (if areaMetric is "nanometerSq" then "selected" else "") + """>Nanometer Sq</option>
                        <option value='micrometerSq' """ + (if areaMetric is "micrometerSq" then "selected" else "") + """>Micrometer Sq</option>
                        <option value='millimeterSq' """ + (if areaMetric is "millimeterSq" then "selected" else "") + """>Millimeter Sq</option>
                        <option value='centimeterSq' """ + (if areaMetric is "centimeterSq" then "selected" else "") + """>Centimeter Sq</option>
                        <option value='decimeterSq' """ + (if areaMetric is "decimeterSq" then "selected" else "") + """>Decimeter Sq</option>
                        <option value='meterSq' """ + (if areaMetric is "meterSq" then "selected" else "") + """>Meter Sq</option>

                    </select>

                    <select id='scales-area' class='imperial'>

                        <option value='inchSq' """ + (if areaImperial is "inchSq" then "selected" else "") + """>Inch Sq</option>
                        <option value='footSq' """ + (if areaImperial is "footSq" then "selected" else "") + """>Foot Sq</option>
                        <option value='yardSq' """ + (if areaImperial is "yardSq" then "selected" else "") + """>Yard Sq</option>

                    </select>

                </div>

                <div>

                    <label>Volume:</label>

                    <select id='scales-volume' class='metric'>

                        <option value='nanometerCu' """ + (if volumeMetric is "nanometerCu" then "selected" else "") + """>Nanometer Cu</option>
                        <option value='micrometerCu' """ + (if volumeMetric is "micrometerCu" then "selected" else "") + """>Micrometer Cu</option>
                        <option value='millimeterCu' """ + (if volumeMetric is "millimeterCu" then "selected" else "") + """>Millimeter Cu</option>
                        <option value='centimeterCu' """ + (if volumeMetric is "centimeterCu" then "selected" else "") + """>Centimeter Cu</option>
                        <option value='decimeterCu' """ + (if volumeMetric is "decimeterCu" then "selected" else "") + """>Decimeter Cu</option>
                        <option value='meterCu' """ + (if volumeMetric is "meterCu" then "selected" else "") + """>Meter Cu</option>

                    </select>

                    <select id='scales-volume' class='imperial'>

                        <option value='inchCu' """ + (if volumeImperial is "inchCu" then "selected" else "") + """>Inch Cu</option>
                        <option value='footCu' """ + (if volumeImperial is "footCu" then "selected" else "") + """>Foot Cu</option>
                        <option value='yardCu' """ + (if volumeImperial is "yardCu" then "selected" else "") + """>Yard Cu</option>

                    </select>

                </div>

            </div>
            """

        uiSettings =

            """
            <div id='ui-settings' class='settings-category'>

                <h4>UI</h4>

                <div>

                    <input id='ui-fullscreen' class='checkbox' type='checkbox'><label>Fullscreen</label>

                </div>

                <div>

                    <input id='ui-navbar' class='checkbox' type='checkbox' """ + (if settings.get "ui.navbar" then "checked" else "") + """><label>Navbar</label>

                </div>

                <div>

                    <input id='ui-forkme' class='checkbox' type='checkbox' """ + (if settings.get "ui.forkme" then "checked" else "") + """><label>Forkme</label>

                </div>

                <div>

                    <input id='ui-metabox' class='checkbox' type='checkbox' """ + (if settings.get "ui.metabox" then "checked" else "") + """><label>Metabox</label>

                </div>

                <div>

                    <input id='ui-help' class='checkbox' type='checkbox' """ + (if settings.get "ui.help" then "checked" else "") + """><label>Help</label>

                </div>

            </div>
            """

        tooltipsSettings =

            """
            <div id='tooltips-settings' class='settings-category'>

                <h4>Tooltips</h4>

                <div>

                    <input id='tooltips-guidelines' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.guidelines" then "checked" else "") + """><label>Guidelines</label>

                </div>

                <div>

                    <input id='tooltips-measurements' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.measurements" then "checked" else "") + " " + (if settings.get "tooltips.guidelines" then "" else "disabled") + """><label>Measurements</label>

                </div>

                <div>

                    <input id='tooltips-rotation' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.rotation" then "checked" else "") + """><label>Rotation Tools</label>

                </div>

                <div>

                    <input id='tooltips-bounding' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.bounding" then "checked" else "") + """><label>Bounding Box</label>

                </div>

            </div>
            """

        gridSettings =

            """
            <div id='grid-settings' class='settings-category'>

                <h4>Grid</h4>

                <div>

                    <input id='tooltips-grid-caps' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.caps" then "checked" else "") + """><label>Axes Caps</label>

                </div>

                <div>

                    <input id='tooltips-grid-axes-x' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.x" then "checked" else "") + """><label>X Axis</label>

                </div>

                <div>

                    <input id='tooltips-grid-axes-y' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.y" then "checked" else "") + """><label>Y Axis</label>

                </div>

                <div>

                    <input id='tooltips-grid-axes-z' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.axes.z" then "checked" else "") + """><label>Z Axis</label>

                </div>

                <div>

                    <input id='tooltips-grid-ticks-xy' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.xy" then "checked" else "") + """><label>XY Plane</label>

                </div>

                <div>

                    <input id='tooltips-grid-ticks-xz' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.xz" then "checked" else "") + """><label>XZ Plane</label>

                </div>

                <div>

                    <input id='tooltips-grid-ticks-yz' class='checkbox' type='checkbox' """ + (if settings.get "tooltips.grid.ticks.yz" then "checked" else "") + """><label>YZ Plane</label>

                </div>

            </div>
            """

        $("body").append settingsPanel

        @panel = $("#settings.panel")

        @firstColumn = this.panel.find "#first.settings-column"
        @secondColumn = this.panel.find "#second.settings-column"
        @thirdColumn = this.panel.find "#third.settings-column"

        this.firstColumn.append measurementSettings
        this.secondColumn.append uiSettings
        this.secondColumn.append tooltipsSettings
        this.thirdColumn.append gridSettings

        @measurementSettings = this.firstColumn.find "#measurement-settings.settings-category"
        @uiSettings = this.secondColumn.find "#ui-settings.settings-category"
        @tooltipsSettings = this.secondColumn.find "#tooltips-settings.settings-category"
        @gridSettings =  this.thirdColumn.find "#grid-settings.settings-category"

        this.events()

    remove: ->

        this.panel.remove()

    show: ->

        this.panel.css "visibility", "visible"
        this.panel.css "z-index", events.zIndex += 1

    hide: ->

        this.panel.css "visibility", "hidden"

    events: ->

        panels.events this.panel

        this.measurementSettings.find("select." + (settings.get "scales.scale") + "").css "display", "block"

        this.measurementSettings.find("select").on "change", (event) =>

            $(event.target).blur()

            path = $(event.target).attr("id").split("-")
            value = $(event.target).find(":selected").val()

            if path[1] isnt "scale"

                path.push "unit", settings.get "scales.scale"

            settings.set path, value

        this.measurementSettings.find("select").on "mousedown mouseup", (event) =>

            event.stopPropagation()

        this.panel.find(".checkbox").on "click", (event) =>

            $(event.target).blur()

            path = $(event.target).attr("id").split("-")
            value = $(event.target).prop("checked")

            settings.set path, value

        this.panel.find(".checkbox").on "mousedown mouseup", (event) =>

            event.stopPropagation()
