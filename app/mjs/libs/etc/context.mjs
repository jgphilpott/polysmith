export function contextMenu(element, domEvent) {

  $("#context-menu.panel").remove()

  $("body").append("<div id='context-menu' class='panel'></div>")

  let contextMenu = $("#context-menu.panel")
  let contextMenuWidth = contextMenu.outerWidth()
  let contextMenuHeight = contextMenu.outerHeight()

  let offset = 5

  if (domEvent.pageX >= $(window).width() / 2) {
    contextMenu.css("left", domEvent.pageX - contextMenuWidth + offset)
  } else if (domEvent.pageX < $(window).width() / 2) {
    contextMenu.css("left", domEvent.pageX - offset)
  }

  if (domEvent.pageY >= $(window).height() / 2) {
    contextMenu.css("top", domEvent.pageY - contextMenuHeight + offset)
  } else if (domEvent.pageY < $(window).height() / 2) {
    contextMenu.css("top", domEvent.pageY - offset)
  }

  contextMenu.mouseout(function() { contextMenu.remove() })

}
