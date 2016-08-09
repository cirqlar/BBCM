# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

nextSlide = 1
sliderI = null
servicerI = null
slider = ->
  if 0 > nextSlide || nextSlide > ($('.slide').length - 1)
    nextSlide = 0

  for x in [1..$('.slide').length]
    $('.slide')[x-1].style.opacity = 0
    $('.slide')[nextSlide].style.opacity = 1
  nextSlide++

nextService = 1
servicer = ->
  if 0 > nextService || nextService > ($('.service').length - 1)
    nextService = 0

  for x in [1..$('.service').length]
    $('.service')[x-1].style.opacity = 0
    $('.service')[nextService].style.opacity = 1
  nextService++

setPoints = ->
  if $('.slide').length == 0
    console.log 'no'
    return
  titles = []
  for x in [1..$('.slide').length]
    titles[x-1] = $('.slide')[x-1].dataset.title
  for title, index in titles
    $('#slides').append("<span id='#{index}'>#{title}</span>")

$(document).on 'turbolinks:load', ->
  setPoints();
  sliderI = window.setInterval(slider, 7000)
  servicerI = window.setInterval(servicer, 7000)

$(document).on 'turbolinks:before-visit', ->
  window.clearInterval(sliderI)
  window.clearInterval(servicerI)
