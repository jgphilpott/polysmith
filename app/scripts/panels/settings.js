function addSettingsPanel() {

  $("body").append("<div id='settings' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#settings.panel")

  panel.append("<h3>Advanced Settings</h3>")

  let general =

    `<div id='general-settings' class='settings-category'>

      <h4>General</h4>

      <div>
        <label>Scale</label>
        <select id='general-scale' class='select'>
          <option value='imperial' ` + (settings.general.scale == "imperial" ? "selected" : "") + `>Imperial</option>
          <option value='metric' ` + (settings.general.scale == "metric" ? "selected" : "") + `>Metric</option>
        </select>
      </div>

    </div>`

  let ui =

    `<div id='ui-settings' class='settings-category'>

      <h4>UI</h4>

      <div>
        <input id='ui-navbar' class='checkbox' type='checkbox' ` + (settings.ui.navbar ? "checked" : "") + `><label>Navbar</label>
      </div>
      <div>
        <input id='ui-forkme' class='checkbox' type='checkbox' ` + (settings.ui.forkme ? "checked" : "") + `><label>Forkme</label>
      </div>
      <div>
        <input id='ui-metabox' class='checkbox' type='checkbox' ` + (settings.ui.metabox ? "checked" : "") + `><label>Metabox</label>
      </div>
      <div>
        <input id='ui-help' class='checkbox' type='checkbox' ` + (settings.ui.help ? "checked" : "") + `><label>Help</label>
      </div>

    </div>`

  let axes =

    `<div id='axes-settings' class='settings-category'>

      <h4>Axes</h4>

      <div>
        <input id='axes-axesCaps' class='checkbox' type='checkbox' ` + (settings.axes.axesCaps ? "checked" : "") + `><label>Axes Caps</label>
      </div>

      <div>
        <input id='axes-xAxis' class='checkbox' type='checkbox' ` + (settings.axes.xAxis ? "checked" : "") + `><label>X Axis</label>
      </div>
      <div>
        <input id='axes-yAxis' class='checkbox' type='checkbox' ` + (settings.axes.yAxis ? "checked" : "") + `><label>Y Axis</label>
      </div>
      <div>
        <input id='axes-zAxis' class='checkbox' type='checkbox' ` + (settings.axes.zAxis ? "checked" : "") + `><label>Z Axis</label>
      </div>

      <div>
        <input id='axes-xyPlane' class='checkbox' type='checkbox' ` + (settings.axes.xyPlane ? "checked" : "") + `><label>XY Plane</label>
      </div>
      <div>
        <input id='axes-xzPlane' class='checkbox' type='checkbox' ` + (settings.axes.xzPlane ? "checked" : "") + `><label>XZ Plane</label>
      </div>
      <div>
        <input id='axes-yzPlane' class='checkbox' type='checkbox' ` + (settings.axes.yzPlane ? "checked" : "") + `><label>YZ Plane</label>
      </div>

    </div>`

  panel.append(general)
  panel.append(ui)
  panel.append(axes)

  panel.find(".select").on("change", function(event) {

    $(this).blur()

    let status = $(this).find(":selected").val()
    let setting = $(this).attr("id").split("-")

    updateSettings(setting[0], setting[1], status)

  }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  panel.find(".checkbox").click(function(event) {

    $(this).blur()

    let status = $(this).prop("checked")
    let setting = $(this).attr("id").split("-")

    updateSettings(setting[0], setting[1], status)

  }).on("mousedown mouseup", function(event) { event.stopPropagation() })

  return panel

}