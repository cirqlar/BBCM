# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

g_addEvent = (el, ev, fn, uC = true) ->
  if el.addEventListener
    el.addEventListener(ev, fn, uC)
    true
  else if (el.attachEvent)
    el.attachEvent("on#{ev}", fn)

class Media
  @type: null
  @container: null
  @mediaElem: null
  @poster: null
  @midBtn: null
  @contBtn: null
  @progress: null
  @pFill: null
  @pDrag: null
  @time: null
  @duration: null
  @screen: null
  @volume: null
  @vImg: null
  @vCont: null
  @vSlide: null
  @vDrag: null
  @updating: null

  constructor: (type = 'video') ->
    Media.type = type
    @getElements()
    @EventListeners()


  getElements: () ->
    Media.container = document.getElementById("#{Media.type}Cont")
    Media.mediaElem = document.getElementById("#{Media.type}")
    Media.poster = document.getElementById('poster')
    Media.midBtn = document.getElementById('middleButton')
    Media.contBtn = document.getElementById('controlButton')
    Media.progress = document.getElementById('progress')
    Media.pFill = document.getElementById('fill')
    Media.pDrag = document.getElementById('drag')
    Media.time = document.getElementById('time')
    Media.duration = document.getElementById('duration')
    Media.screen = document.getElementById('screen')
    Media.volume = document.getElementById('volume')
    Media.vImg = document.getElementById('vimg')
    Media.vCont = document.getElementById('vcont')
    Media.vSlide = document.getElementById('vslide')
    Media.vDrag = document.getElementById('vdrag')
    true

  EventListeners: () ->
    g_addEvent(Media.mediaElem, 'click', @playPause)
    g_addEvent(Media.poster, 'click', @playPause)
    g_addEvent(Media.midBtn, 'click', @playPause)
    g_addEvent(Media.contBtn, 'click', @playPause)
    g_addEvent(Media.progress, 'click', @progressClick)
    g_addEvent(Media.vImg, 'click', @vMute)
    g_addEvent(Media.vSlide, 'click', @vSClick)
#    g_addEvent(Media.container, '', @refindit)
    true

  playPause: () ->
    if !Media.mediaElem.paused && !Media.mediaElem.ended
      Media.mediaElem.pause()
      window.clearInterval(Media.updating)
      Media.container.className = 'pause'
      true
    else
      Media.mediaElem.play()
      Media.updating = window.setInterval(Media.updater, 50)
      if !(Media.container.className == 'pause')
        Media.duration.innerHTML = Media.durationer Media.mediaElem.duration
      Media.container.className = 'play'
      true

  @updater: () ->
    if !Media.mediaElem.ended
      length = (Media.mediaElem.currentTime / Media.mediaElem.duration) * 100
      Media.pFill.style.width = length + '%';
      Media.pDrag.style.left = length + '%';
      Media.time.innerHTML = Media.durationer Media.mediaElem.currentTime
      true
    else
      Media.pFill.style.width = '100%';
      Media.pDrag.style.left = '100%';
      Media.time.innerHTML = Media.durationer Media.mediaElem.duration
      Media.container.className = ''
      window.clearInterval(Media.updating)
      true

  @durationer: (dur) ->
    hrs = 0
    min = 0
    sec = 0
    fdur = null
    if dur > 60
      min = parseInt(dur/60)
      sec = ("0" + parseInt(dur%60)).slice(-2)
    else
      sec = ("0" + parseInt(dur%60)).slice(-2)

    if min > 60
      hrs = parseInt(min/60)
      min = parseInt(min%60)
    else
      min = ("0" + min).slice(-2)

    if hrs > 0
      fdur = hrs + ':' + min + ':' + sec
    else
      fdur = min + ':' + sec

    return fdur

  progressClick: () ->
    if window.event.srcElement.id != "drag"
      percent = (window.event.offsetX / Media.progress.clientWidth) * 100
      ntime = Media.mediaElem.duration * percent / 100
      Media.mediaElem.currentTime = ntime
      Media.updater()
      console.log window.event.srcElement.id
      true

  vMute: () ->
    if Media.mediaElem.muted == true
      Media.mediaElem.muted = false
      Media.vImg.className = ''
    else
      Media.mediaElem.muted = true
      Media.vImg.className = 'mute'

  vSClick: () ->
    if window.event.srcElement.id != "vdrag"
      vol = (window.event.offsetX / Media.vSlide.clientWidth) * 100
      Media.vDrag.style.left = vol + "%"
      Media.mediaElem.volume = vol/100

  refindit: () ->
    if document.getElementById('video')
      charles = new Media('video')
      document.charles = charles
    else if document.getElementById('audio')
      charles = new Media('audio')
      document.charles = charles

setIt = (type = 'video') ->
  charles = new Media(type)
  document.charles = charles

findIt = () ->
  if document.getElementById('video')
    setIt('video')
  else if document.getElementById('audio')
    setIt('audio')

$(document).on "turbolinks:load", ->
  findIt()
