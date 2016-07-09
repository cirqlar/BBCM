# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  if document.getElementById("announcement_expires_at_1i")
    $('#announcement_expires_at_1i').detach().insertAfter('#announcement_expires_at_3i')
    $('#announcement_expires_at_4i').detach().insertBefore('#announcement_expires_at_2i')
    $('#announcement_expires_at_5i').detach().insertAfter('#announcement_expires_at_4i')
