$(document).on 'turbolinks:load', ->
  $('#flash p').on 'click', ->
    $(this).hide
  $('#topCont').on 'click', ->
    $('#topCont').toggleClass 'open'
  $('#menuBtn').on 'click', ->
    $('#nav').toggleClass 'open'
