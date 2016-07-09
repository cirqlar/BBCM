# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

nextSlide = 0
nextShow = 0
slides = document.getElementsByClassName('slide')
shows = document.getElementsByClassName('show')

$(document).on "turbolinks:load", ->
  window.setInterval(slider, 10000)
  window.setInterval(shower, 10000)

slider = ()->
  if 0 > nextSlide || nextSlide >= slides.length
    nextSlide = 0

  for x in [0...slides.length]
    slides[x].style.opacity = 0 unless x == nextSlide
    slides[x].style.opacity = 1 if x == nextSlide

  nextSlide++

shower = ()->
  if 0 > nextShow || nextShow >= shows.length
    nextShow = 0

  for x in [0...shows.length]
    shows[x].style.opacity = 0 unless x == nextShow
    shows[x].style.opacity = 1 if x == nextShow

  nextShow++
