@shows = () ->
  $('#menu-list').css display:'block'

@hides = () ->
  $('#menu-list').css display:'none'

binds = () ->
  $('#user-menu').mouseover(shows)
  $('#menu-list').mouseover(shows)
  $('#user-menu').mouseout(hides)
  $('#menu-list').mouseout(hides)

$(document).ready(binds)



