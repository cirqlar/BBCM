$(document).on 'turbolinks:before-visit', ->
  $('#loading').fadeTo(1000, 1, ->
    $(this).show()
  )

$(document).on 'turbolinks:load', ->
  $('#loading').fadeOut()
