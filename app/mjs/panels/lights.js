function addLightsPanel() {

  $("body").append("<div id='lights' class='panel'><img class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#lights.panel")

  panel.append("<h3>Lights</h3>")

  return panel

}