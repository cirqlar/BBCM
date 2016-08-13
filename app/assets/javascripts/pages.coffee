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

setPoints = ->
  if $('.slide').length == 0
    console.log 'no'
    return
  titles = []
  for x in [1..$('.slide').length]
    titles[x-1] = $('.slide')[x-1].dataset.title
  for title, index in titles
    $('#slides').append("<span id='#{index}'>#{title}</span>")
    g_addEvent $('#slides span')[index], 'click', clickPoints


g_addEvent = (el, ev, fn, uC = true) ->
  if el.addEventListener
    el.addEventListener(ev, fn, uC)
    true
  else if (el.attachEvent)
    el.attachEvent("on#{ev}", fn)

clickPoints = ->
  console.log window.event.srcElement.id
  for x in [1..$('.slide').length]
    $('.slide')[x-1].style.opacity = 0
    $('.slide')[window.event.srcElement.id].style.opacity = 1
  nextSlide = window.event.srcElement.id

$(document).on 'turbolinks:load', ->
  unless $('.slide').length == 0
    setPoints();
    sliderI = window.setInterval(slider, 7000)

$(document).on 'turbolinks:before-visit', ->
  window.clearInterval(sliderI)
