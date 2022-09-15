addSettingsPanel = ->

    settingsPanel =

        """
        <div id='settings' class='panel'>

            <img title='Close' class='close' src='/app/imgs/panels/nav/close.png'>

            <h3>Advanced Settings</h3>

            <div id='first' class='settings-column'></div>
            <div id='second' class='settings-column'></div>
            <div id='third' class='settings-column'></div>

        </div>
        """

    $("body").append settingsPanel

    panel = $("#settings.panel")

    firstSettingsColumn = panel.find "#first.settings-column"
    secondSettingsColumn = panel.find "#second.settings-column"
    thirdSettingsColumn = panel.find "#third.settings-column"

    generalSettings =

        """
        <div id='general-settings' class='settings-category'>

            <h4>General</h4>

            <div>
                <label>Scale</label>
                <select id='general-scale' class='select'>
                    <option value='imperial' """ + (if settings.general.scale == "imperial" then "selected" else "") + """>Imperial</option>
                    <option value='metric' """ + (if settings.general.scale == "metric" then "selected" else "") + """>Metric</option>
                </select>
            </div>

            <div>
                <label>Unit</label>
                <select id='general-unit' class='select'>
                    <option value='centimeters' """ + (if settings.general.unit == "centimeters" then "selected" else "") + """>Centimeters</option>
                    <option value='millimeters' """ + (if settings.general.unit == "millimeters" then "selected" else "") + """>Millimeters</option>
                </select>
            </div>

        </div>
        """

    uiSettings =

        """
        <div id='ui-settings' class='settings-category'>

            <h4>UI</h4>

            <div>
                <input id='ui-navbar' class='checkbox' type='checkbox' """ + (if settings.ui.navbar then "checked" else "") + """><label>Navbar</label>
            </div>
            <div>
                <input id='ui-forkme' class='checkbox' type='checkbox' """ + (if settings.ui.forkme then "checked" else "") + """><label>Forkme</label>
            </div>
            <div>
                <input id='ui-metabox' class='checkbox' type='checkbox' """ + (if settings.ui.metabox then "checked" else "") + """><label>Metabox</label>
            </div>
            <div>
                <input id='ui-help' class='checkbox' type='checkbox' """ + (if settings.ui.help then "checked" else "") + """><label>Help</label>
            </div>

        </div>
        """

    tooltipsSettings =

        """
        <div id='tooltips-settings' class='settings-category'>

            <h4>Tooltips</h4>

            <div>
                <input id='tooltips-guidelines' class='checkbox' type='checkbox' """ + (if settings.tooltips.guidelines then "checked" else "") + """><label>Guidelines</label>
            </div>

            <div>
                <input id='tooltips-measurements' class='checkbox' type='checkbox' """ + (if settings.tooltips.measurements then "checked" else "") + " " + (if settings.tooltips.guidelines then "" else "disabled") + """><label>Measurements</label>
            </div>

        </div>
        """

    axesSettings =

        """
        <div id='axes-settings' class='settings-category'>

            <h4>Axes</h4>

            <div>
                <input id='axes-axesCaps' class='checkbox' type='checkbox' """ + (if settings.axes.axesCaps then "checked" else "") + """><label>Axes Caps</label>
            </div>

            <div>
                <input id='axes-xAxis' class='checkbox' type='checkbox' """ + (if settings.axes.xAxis then "checked" else "") + """><label>X Axis</label>
            </div>
            <div>
                <input id='axes-yAxis' class='checkbox' type='checkbox' """ + (if settings.axes.yAxis then "checked" else "") + """><label>Y Axis</label>
            </div>
            <div>
                <input id='axes-zAxis' class='checkbox' type='checkbox' """ + (if settings.axes.zAxis then "checked" else "") + """><label>Z Axis</label>
            </div>

            <div>
                <input id='axes-xyPlane' class='checkbox' type='checkbox' """ + (if settings.axes.xyPlane then "checked" else "") + """><label>XY Plane</label>
            </div>
            <div>
                <input id='axes-xzPlane' class='checkbox' type='checkbox' """ + (if settings.axes.xzPlane then "checked" else "") + """><label>XZ Plane</label>
            </div>
            <div>
                <input id='axes-yzPlane' class='checkbox' type='checkbox' """ + (if settings.axes.yzPlane then "checked" else "") + """><label>YZ Plane</label>
            </div>

        </div>
        """

    firstSettingsColumn.append generalSettings

    secondSettingsColumn.append uiSettings
    secondSettingsColumn.append tooltipsSettings

    thirdSettingsColumn.append axesSettings

    panel.find(".select").on("change", (event) ->

        $(this).blur()

        status = $(this).find(":selected").val()
        setting = $(this).attr("id").split("-")

        updateSettings setting[0], setting[1], status

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    panel.find(".checkbox").click((event) ->

        $(this).blur()

        status = $(this).prop("checked")
        setting = $(this).attr("id").split("-")

        updateSettings setting[0], setting[1], status

    ).on "mousedown mouseup", (event) -> event.stopPropagation()

    return panel
