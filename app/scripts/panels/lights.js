function addLightsPanel() {

  $("body").append("<div id='lights' class='panel'><img title='Close' class='close' src='/app/imgs/panels/nav/close.png'></div>")

  let panel = $("#lights.panel")

  panel.append("<img title='Lights' class='lights' src='/app/imgs/panels/main/light.png'>")
  panel.append("<img title='Reset Lights' class='reset' src='/app/imgs/panels/tools/reset.png'>")

  panel.append("<p id='none'><b>None</b></p>")

  panel.append("<img title='Add New Light' class='add' src='/app/imgs/panels/nav/+.png'>")

  return panel

}