# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

nextSlide = 1
slider = ->
  if 0 > nextSlide || nextSlide > ($('.slide').length - 1)
    nextSlide = 0

  $('#slider').css("top", "-#{nextSlide * 100}%")
  nextSlide++

nextService = 1
servicer = ->
  if 0 > nextService || nextService > ($('.service').length - 1)
    nextService = 0

  $('#servicer').css("top", "-#{nextService * 100}%")
  nextService++

$(document).on 'turbolinks:load', ->
  window.setInterval(slider, 7000)
  window.setInterval(servicer, 7000)
