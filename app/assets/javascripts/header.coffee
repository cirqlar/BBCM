window.onscroll = () ->
  if window.scrollY > 0
    $('#header').removeClass('open')
  else
    $('#header').addClass('open')
