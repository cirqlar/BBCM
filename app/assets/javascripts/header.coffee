$(document).on 'turbolinks:load', ->
  $('#menuBtn').on 'click', ->
    $('#nav').toggleClass 'open'
