$(document).on 'turbolinks:load', ->
  $('#flash').on 'click', ->
    $('#flash').hide()
  $('#menuBtn').on 'click', ->
    $('#nav').toggleClass 'open'
