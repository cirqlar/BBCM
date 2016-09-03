$(document).on 'turbolinks:load', ->
  $('#flash p').on 'click', ->
    $(this).hide
#  $('#topCont').on 'hover', ->
#    $('#topCont').toggleClass 'open'
  $('#menuBtn').on 'click', ->
    $('#nav').toggleClass 'open'
