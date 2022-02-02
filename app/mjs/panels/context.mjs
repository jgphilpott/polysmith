export function addContextPanel() {

  $("#nav, #forkme, #canvas, .panel").mouseover(function() { $("#context-menu.panel").remove() })

}

export function contextMenu(type, element, event) {

  $("body").append("<div id='context-menu' class='panel'></div>")

  let contextMenu = $("#context-menu.panel")

  switch (type) {

    case "mesh":

      contextMenu.append("<p>Open Panel</p>")
      contextMenu.append("<p>Look Here</p>")
      contextMenu.append("<p>Remove Mesh</p>")

      break

  }

  positionMenu(contextMenu, event)

}

function positionMenu(menu, event) {

  let padding = 5

  let contextMenuWidth = menu.outerWidth()
  let contextMenuHeight = menu.outerHeight()

  if (event.pageX >= window.innerWidth / 2) {
    menu.css("left", event.pageX - contextMenuWidth + padding)
  } else if (event.pageX < window.innerWidth / 2) {
    menu.css("left", event.pageX - padding)
  }

  if (event.pageY >= window.innerHeight / 2) {
    menu.css("top", event.pageY - contextMenuHeight + padding)
  } else if (event.pageY < window.innerHeight / 2) {
    menu.css("top", event.pageY - padding)
  }

}
