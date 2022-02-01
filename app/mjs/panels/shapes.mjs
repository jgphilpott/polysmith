export function addShapesPanel() {

  $("body").append("<div id='shapes' class='panel'></div>")

  let panel = $("#shapes.panel")

  panel.append("<img id='cube' class='shape' src='/app/imgs/icons/shapes/basic/cube.png'>")
  panel.append("<img id='cylinder' class='shape' src='/app/imgs/icons/shapes/basic/cylinder.png'>")
  panel.append("<img id='sphere' class='shape' src='/app/imgs/icons/shapes/basic/sphere.png'>")

  panel.append("<img id='+' class='nav' src='/app/imgs/icons/nav/+.png'>")

}
