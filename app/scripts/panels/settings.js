function addSettingsPanel() {

  $("body").append("<div id='settings' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#settings.panel")

  panel.append("<h3>Advanced Settings</h3>")

  return panel

}