import {addPanelEvents} from "../libs/etc/events.mjs"

export function addSettingsPanel() {

  $("body").append("<div id='settings' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#settings.panel")

  panel.append("<h3>Settings</h3>")

  addPanelEvents(panel)

}